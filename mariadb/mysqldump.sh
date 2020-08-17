#!/bin/sh

set -eu

while :
do
    sleep 1h
    mysqldump --single-transaction -h mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" nextcloud > /var/lib/mysql/nextcloud-mysqldump.sql
done