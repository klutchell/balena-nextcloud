FROM nextcloud:19.0.1-fpm-alpine

COPY mount.sh sshd.sh /

RUN apk add --no-cache curl openssh rsync sudo \
    && chmod +x /mount.sh /sshd.sh \
    && sed -r 's|^([# ]*)?PasswordAuthentication (.*)|PasswordAuthentication no|' /etc/ssh/sshd_config \
    && mkdir -m 0700 ~/.ssh
