#!/bin/sh

mount -v UUID="NEXTCLOUD" /var/www/html/data
chown -v www-data:www-data /var/www/html/data