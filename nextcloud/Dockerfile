FROM nextcloud:19.0.1-fpm-alpine

COPY mount.sh /mount.sh

RUN apk add --no-cache sudo && chmod +x /mount.sh

VOLUME /data

ENV NEXTCLOUD_DATA_DIR "/data"
