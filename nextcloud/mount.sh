#!/bin/sh

set -e

mount -v LABEL="NEXTCLOUD" /var/www/html/data
chown -v www-data:www-data /var/www/html/data
