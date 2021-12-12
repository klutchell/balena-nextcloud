# https://hub.docker.com/_/nextcloud
FROM nextcloud:23.0.0-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache bash blkid lsblk jq samba-client sudo supervisor

COPY supervisord.conf run.sh /

RUN chmod +x /run.sh

ENV NEXTCLOUD_UPDATE 1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
