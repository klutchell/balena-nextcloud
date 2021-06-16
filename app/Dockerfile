FROM nextcloud:21.0.2-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache blkid samba-client sudo

COPY custom-init.sh /

RUN chmod +x /custom-init.sh

ENTRYPOINT [ "/custom-init.sh" ]

ENV BALENA_HOSTNAME nextcloud

ENV NEXTCLOUD_TRUSTED_DOMAINS "nextcloud.local *.balena-devices.com"
