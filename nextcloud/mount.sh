#!/bin/sh

set -e

mount -v LABEL="NEXTCLOUD" /data
chown -v www-data:www-data /data
