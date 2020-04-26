FROM nextcloud:stable-apache

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /files

ENTRYPOINT [ "sh", "-c", "mount -L NEXTCLOUD /files && chown www-data /files && /entrypoint.sh apache2-foreground" ]

CMD [ "" ]
