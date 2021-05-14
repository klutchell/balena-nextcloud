#!/bin/sh

# openFleets: configure hostname
curl -X PATCH --header "Content-Type:application/json" \
    --data "{\"network\": {\"hostname\": \"$BALENA_HOSTNAME\"}}" \
    "$BALENA_SUPERVISOR_ADDRESS/v1/device/host-config?apikey=$BALENA_SUPERVISOR_API_KEY"

exec /entrypoint.sh php-fpm
