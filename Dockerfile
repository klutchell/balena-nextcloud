FROM nextcloud:stable-apache

ENV DEBIAN_FRONTEND noninteractive

COPY mount.sh /

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo smbclient \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && chmod a+x /mount.sh

ENTRYPOINT [ "sh", "-c", "/mount.sh && /entrypoint.sh apache2-foreground" ]

CMD [ "" ]
