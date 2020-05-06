#!/bin/sh

set -e

for uuid in $(blkid -tLABEL=NEXTCLOUD -sUUID -ovalue)
do
    mkdir -v /media/"${uuid}" 2>/dev/null || true
    mount -v UUID="${uuid}" /media/"${uuid}"
    chown www-data:www-data /media/"${uuid}"
done