#!/bin/sh

# set a hostname for mDNS (default to nextcloud.local)
if [ -n "${BALENA_HOSTNAME}" ]
then
    curl -X PATCH --header "Content-Type:application/json" \
        --data "{\"network\": {\"hostname\": \"${BALENA_HOSTNAME}\"}}" \
        "${BALENA_SUPERVISOR_ADDRESS}/v1/device/host-config?apikey=${BALENA_SUPERVISOR_API_KEY}" || true
fi

# update trusted_domains in config.php
if [ -n "${NEXTCLOUD_TRUSTED_DOMAINS}" ]
then
    domain_idx=0
    for domain in ${NEXTCLOUD_TRUSTED_DOMAINS}
    do
        domain=$(echo "${domain}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        sudo -u www-data PHP_MEMORY_LIMIT=512M php /var/www/html/occ config:system:set trusted_domains ${domain_idx} --value="${domain}"
        domain_idx=$((domain_idx+1))
    done
fi

# automount storage disks at /media/{UUID}
for uuid in $(blkid -sUUID -ovalue /dev/sd??)
do
    mkdir -pv /media/"${uuid}"
    mount -v UUID="${uuid}" /media/"${uuid}"
done

exec /entrypoint.sh php-fpm
