FROM nextcloud:20.0.3-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache sudo

COPY balena-hostname.sh /

RUN chmod +x /balena-hostname.sh

ENTRYPOINT [ "/balena-hostname.sh" ]
