# https://hub.docker.com/_/nextcloud
FROM nextcloud:29.0.1-fpm-alpine@sha256:c4b9a8cca6258015e706152250545c85dbdcc1a1e1c978a6c3d6ae272c7c51a3

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
