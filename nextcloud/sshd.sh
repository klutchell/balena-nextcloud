#!/bin/sh

sed -r 's|^[# ]*?PasswordAuthentication (.*)|PasswordAuthentication no|' /etc/ssh/sshd_config

mkdir -v -m 0700 ~/.ssh

curl -s "https://github.com/${GITHUB_USERNAME}.keys" > ~/.ssh/authorized_keys

chmod -v 600 ~/.ssh/authorized_keys

ssh-keygen -A

/usr/sbin/sshd -D -e