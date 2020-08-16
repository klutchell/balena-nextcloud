FROM nextcloud:19.0.1-fpm-alpine

RUN apk add --no-cache curl openssh rsync sudo

COPY entrypoint.sh sshd.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["apache2-foreground"]
