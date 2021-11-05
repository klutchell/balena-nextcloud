FROM nextcloud:22.2.0-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache bash blkid lsblk jq samba-client sudo supervisor

COPY supervisord.conf run.sh /

RUN chmod +x /run.sh

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
