# https://hub.docker.com/_/nextcloud
FROM nextcloud:28.0.3-fpm-alpine@sha256:1cb0b97412404dfbbd0fa5e2c0f74bb00452afb627520b1f90045b8617aff805

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
