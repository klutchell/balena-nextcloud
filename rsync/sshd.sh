#!/bin/sh

set -eu

curl -s "https://github.com/${GITHUB_USERNAME}.keys" > ~/.ssh/authorized_keys

chmod 600 ~/.ssh/authorized_keys

ssh-keygen -A

/usr/sbin/sshd -D -e