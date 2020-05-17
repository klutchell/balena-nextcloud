#!/bin/sh

for uuid in $(blkid -sUUID -ovalue /dev/sd??)
do
    mkdir -v /media/"${uuid}" 2>/dev/null
    mount -v UUID="${uuid}" /media/"${uuid}"
    chown -v www-data:www-data /media/"${uuid}"
done

if [ -n "${SMB_SHARE}" ]
then
    mkdir -v /mnt/samba 2>/dev/null
    mount -v ${SMB_SHARE} /mnt/samba
fi

exit 0