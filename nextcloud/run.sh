#!/usr/bin/env bash

# update trusted_domains in config.php
if [ -n "${NEXTCLOUD_TRUSTED_DOMAINS:-}" ]
then
    domain_idx=0
    for domain in ${NEXTCLOUD_TRUSTED_DOMAINS}
    do
        domain=$(echo "${domain}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        sudo -E -u www-data php /var/www/html/occ config:system:set trusted_domains ${domain_idx} --value="${domain}"
        domain_idx=$((domain_idx+1))
    done
fi

# automount USB device partitions at /media/{UUID}
for uuid in $(blkid -sUUID -ovalue -t LABEL=NEXTCLOUD)
do
    {
        mkdir -pv /media/"${uuid}"
        mount -v UUID="${uuid}" /media/"${uuid}"
        chown -R www-data:www-data /media/"${uuid}"
        chmod -R 770 /media/"${uuid}"
    } || continue
done

exec php-fpm
