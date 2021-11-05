FROM nextcloud:22.1.1-fpm-alpine

# hadolint ignore=DL3018
RUN apk add --no-cache bash blkid samba-client sudo

COPY custom-init.sh /

RUN chmod +x /custom-init.sh

ENTRYPOINT [ "/custom-init.sh" ]
