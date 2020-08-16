FROM nextcloud:stable-fpm-alpine

COPY mount.sh /mount.sh

CMD ["/bin/sh", "-c", "/mount.sh && apache2-foreground"]
