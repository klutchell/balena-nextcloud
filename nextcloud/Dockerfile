FROM nextcloud:16.0.4-apache

RUN mkdir /data && echo "LABEL=STORAGE /data ext4 rw,relatime,discard,data=ordered 0 2" >> /etc/fstab

ENTRYPOINT [ "sh", "-c", "mount /data && /entrypoint.sh apache2-foreground" ]

CMD [ "" ]
