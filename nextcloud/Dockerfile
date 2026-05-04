# https://hub.docker.com/_/nextcloud
FROM nextcloud:33.0.3-fpm-alpine@sha256:901170f2484eca22e9cf15e41befd70c5210ea26e68a09ebf86d385b7fb7e4d4

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
