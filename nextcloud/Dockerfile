FROM linuxserver/nextcloud

RUN echo "LABEL=storage /mnt/storage ext4 rw,relatime,discard,data=ordered 0 2" >> /etc/fstab

ENTRYPOINT [ "sh", "-c", "mkdir /mnt/storage && mount /mnt/storage && /init" ]