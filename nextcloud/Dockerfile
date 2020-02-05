FROM nextcloud:18

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends smbclient \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir -p /data

ENTRYPOINT [ "sh", "-c", "(mount -L NEXTCLOUD /data && chown www-data /data) ; /entrypoint.sh apache2-foreground" ]

CMD [ "" ]
