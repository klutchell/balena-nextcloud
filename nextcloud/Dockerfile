FROM nextcloud:19.0.4-fpm-alpine

COPY mount.sh configure.sh /

RUN apk add --no-cache sudo && chmod +x /mount.sh /configure.sh

VOLUME /data

ENV NEXTCLOUD_DATA_DIR "/data"
