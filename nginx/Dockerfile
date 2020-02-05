FROM nginx:1

RUN apt-get update && apt-get install -yq --no-install-recommends rsync \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir /www

CMD [ "sh", "-c", "(mount -L WWW /www && rsync -avz --delete /www/ /usr/share/nginx/html/) || : ; nginx -g 'daemon off;'" ]
