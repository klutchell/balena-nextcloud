#!/bin/sh

set -eu

while :
do
    sleep 1h
    mysqldump -h mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" --all-databases > /var/lib/mysql/mysqldump.sql
done