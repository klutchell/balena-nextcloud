FROM nextcloud:21.0.2-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache sudo

COPY balena-hostname.sh /

RUN chmod +x /balena-hostname.sh

ENTRYPOINT [ "/balena-hostname.sh" ]

ENV BALENA_HOSTNAME nextcloud

ENV NEXTCLOUD_TRUSTED_DOMAINS "*.balena-devices.com"
