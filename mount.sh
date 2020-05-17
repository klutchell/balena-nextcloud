#!/bin/sh

for uuid in $(blkid -sUUID -ovalue /dev/sd??)
do
    mkdir -v /media/"${uuid}" 2>/dev/null
    mount -v UUID="${uuid}" /media/"${uuid}"
    chown -v www-data:www-data /media/"${uuid}"
done

if [ -n "${EXTRA_MOUNT}" ]
then
    mkdir -v /mnt/storage 2>/dev/null
    mount -v ${EXTRA_MOUNT} /mnt/storage
fi

exit 0