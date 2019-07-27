FROM linuxserver/nextcloud

RUN mkdir /mnt/storage \
    && echo "LABEL=STORAGE /mnt/storage ext4 rw,relatime,discard,data=ordered 0 2" >> /etc/fstab

ENTRYPOINT [ "sh", "-c", "mount /mnt/storage && /init" ]