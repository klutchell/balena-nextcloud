FROM nextcloud:22.1.1-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache bash blkid samba-client sudo supervisor

COPY supervisord.conf run.sh /

RUN chmod +x /run.sh

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
