# https://hub.docker.com/_/nextcloud
FROM nextcloud:35.0.1-fpm-alpine@sha256:f60f95fc06b0ff3c5b60cf4b59e4f7bd33acb358b0f2efb007181457c8cdbe48

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
