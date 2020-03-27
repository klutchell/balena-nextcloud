FROM nextcloud:stable-apache

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /files

ENTRYPOINT [ "sh", "-c", "(mount -L NEXTCLOUD /files && chown www-data /files) || : ; /entrypoint.sh apache2-foreground" ]

CMD [ "" ]
