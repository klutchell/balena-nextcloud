FROM nextcloud:18

RUN mkdir /data && echo "LABEL=NEXTCLOUD /data ext4 rw,relatime,discard,data=ordered 0 2" >> /etc/fstab

ENTRYPOINT [ "sh", "-c", "mount /data && /entrypoint.sh apache2-foreground" ]

CMD [ "" ]
