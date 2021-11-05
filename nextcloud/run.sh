#!/usr/bin/env bash

# update trusted_domains in config.php
if [ -n "${NEXTCLOUD_TRUSTED_DOMAINS:-}" ]
then
    domain_idx=0
    for domain in ${NEXTCLOUD_TRUSTED_DOMAINS}
    do
        domain=$(echo "${domain}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        sudo -u www-data PHP_MEMORY_LIMIT=512M php /var/www/html/occ config:system:set trusted_domains ${domain_idx} --value="${domain}"
        domain_idx=$((domain_idx+1))
    done
fi

mapfile -t usb_devices < <(lsblk -J -O | jq -r '.blockdevices[] | 
    select(.subsystems=="block:scsi:usb:platform" or .subsystems=="block:scsi:usb:pci:platform") | 
    .path, .children[].path')

# automount USB device partitions at /media/{UUID}
if [ ${#usb_devices[@]} -gt 0 ]
then
    echo "Found USB storage block devices: ${usb_devices[*]}"
    for uuid in $(blkid -sUUID -ovalue "${usb_devices[@]}")
    do
        {
            mkdir -pv /media/"${uuid}"
            mount -v UUID="${uuid}" /media/"${uuid}"
            sudo chown -R www-data:www-data /media/"${uuid}"
            sudo chmod -R 770 /media/"${uuid}"
        } || continue
    done
fi

exec php-fpm
