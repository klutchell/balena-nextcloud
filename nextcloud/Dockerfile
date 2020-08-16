FROM nextcloud:19.0.1-fpm-alpine

COPY mount.sh /mount.sh

CMD ["/bin/sh", "-c", "/mount.sh && apache2-foreground"]
