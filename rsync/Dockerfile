FROM alpine:latest

RUN apk add --no-cache curl openssh rsync \
    && sed -i s/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/ /etc/ssh/sshd_config \
    && mkdir /root/.ssh \
    && chmod 0700 /root/.ssh

COPY sshd.sh /sshd.sh

EXPOSE 22

CMD ["/bin/sh", "-c", "while : ; do /sshd.sh ; sleep 5m ; done"]