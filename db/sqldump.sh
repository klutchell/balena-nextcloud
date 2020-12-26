#!/bin/sh

set -eu

while :
do
    sleep 1h
    mysqldump --single-transaction \
        -h db \
        -u root \
        -p"${MYSQL_ROOT_PASSWORD}" \
        "${MYSQL_DATABASE}" > "/var/lib/mysql/${MYSQL_DATABASE}.sqldump"
done