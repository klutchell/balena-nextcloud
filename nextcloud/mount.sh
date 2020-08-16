#!/bin/sh

set -eu

mount -v LABEL="NEXTCLOUD" "${NEXTCLOUD_DATA_DIR}"
chown -v www-data:www-data "${NEXTCLOUD_DATA_DIR}"
