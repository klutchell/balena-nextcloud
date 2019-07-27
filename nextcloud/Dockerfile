FROM linuxserver/nextcloud

RUN echo "LABEL=STORAGE /data ext4 rw,relatime,discard,data=ordered 0 2" >> /etc/fstab

ENTRYPOINT [ "sh", "-c", "mount /data && /init" ]