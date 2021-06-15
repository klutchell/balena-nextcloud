FROM nextcloud:21.0.2-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache sudo

COPY balena-entry.sh /

RUN chmod +x /balena-entry.sh

ENTRYPOINT [ "/balena-entry.sh" ]

ENV BALENA_HOSTNAME nextcloud

ENV NEXTCLOUD_TRUSTED_DOMAINS "nextcloud.local *.balena-devices.com"
