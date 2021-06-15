#!/bin/sh

# set a hostname for mDNS (default to nextcloud.local)
if [ -n "${BALENA_HOSTNAME}" ]
then
    curl -X PATCH --header "Content-Type:application/json" \
        --data "{\"network\": {\"hostname\": \"${BALENA_HOSTNAME}\"}}" \
        "${BALENA_SUPERVISOR_ADDRESS}/v1/device/host-config?apikey=${BALENA_SUPERVISOR_API_KEY}" || true
fi

exec /entrypoint.sh php-fpm
