FROM nextcloud:stable-apache

ENV DEBIAN_FRONTEND noninteractive

COPY mount.sh supervisord.conf /

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo smbclient supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && chmod a+x /mount.sh \
    && mkdir /var/log/supervisord /var/run/supervisord

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
