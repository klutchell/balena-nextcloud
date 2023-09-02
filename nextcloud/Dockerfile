# https://hub.docker.com/_/nextcloud
FROM nextcloud:27.0.2-fpm-alpine@sha256:6c65eb787b6c6dfed38aa3658328c5e0c5435fbbd64dbf4d8c48310207ae13da

# hadolint ignore=DL3018
RUN apk add --no-cache bash blkid lsblk jq samba-client sudo supervisor

COPY supervisord.conf run.sh /

RUN chmod +x /run.sh

ENV NEXTCLOUD_UPDATE 1

# allow www-data to sudo entrypoint without password
RUN echo "www-data ALL = NOPASSWD:SETENV: /entrypoint.sh" >> /etc/sudoers

USER www-data

ENTRYPOINT [ "sudo", "-E", "/entrypoint.sh" ]

CMD [ "/usr/bin/supervisord", "-c", "/supervisord.conf" ]
