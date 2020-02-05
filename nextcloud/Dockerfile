FROM nextcloud:18

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends smbclient \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir /files

ENTRYPOINT [ "sh", "-c", "(mount -L NEXTCLOUD /files && chown www-data /files) || : ; /entrypoint.sh apache2-foreground" ]

CMD [ "" ]
