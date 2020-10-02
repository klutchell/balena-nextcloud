#!/bin/sh

set -eu

# if config.php does not exist then it must be first run
if [ ! -f /var/www/html/config/config.php ]
then
    exit 0
fi

# if config.php does exist we can update some fields if env vars have changed

# NEXTCLOUD_TRUSTED_DOMAINS (not set by default) Optional space-separated list of domains.
if [ -n "${NEXTCLOUD_TRUSTED_DOMAINS:-}" ]
then
    sudo -u www-data php /var/www/html/occ config:system:delete trusted_domains
    index=0
    for value in ${NEXTCLOUD_TRUSTED_DOMAINS}
    do
        value=$(echo "${value}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        sudo -u www-data php /var/www/html/occ config:system:set trusted_domains "${index}" --value="${value}"
        index=$((index + 1))
    done
fi

# TRUSTED_PROXIES (empty by default): A space-separated list of trusted proxies. CIDR notation is supported for IPv4.
if [ -n "${TRUSTED_PROXIES:-}" ]
then
    sudo -u www-data php /var/www/html/occ config:system:delete trusted_proxies
    index=0
    for value in ${TRUSTED_PROXIES}
    do
        value=$(echo "${value}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        sudo -u www-data php /var/www/html/occ config:system:set trusted_proxies "${index}" --value="${value}"
        index=$((index + 1))
    done
fi

# OVERWRITEHOST (empty by default): Set the hostname of the proxy. Can also specify a port.
if [ -n "${OVERWRITEHOST:-}" ]
then
    sudo -u www-data php /var/www/html/occ config:system:set overwritehost --value="${OVERWRITEHOST}"
fi

# OVERWRITEPROTOCOL (empty by default): Set the protocol of the proxy, http or https.
if [ -n "${OVERWRITEPROTOCOL:-}" ]
then
    sudo -u www-data php /var/www/html/occ config:system:set overwriteprotocol --value="${OVERWRITEPROTOCOL}"
fi

# OVERWRITEWEBROOT (empty by default): Set the absolute path of the proxy.
if [ -n "${OVERWRITEWEBROOT:-}" ]
then
    sudo -u www-data php /var/www/html/occ config:system:set overwritewebroot --value="${OVERWRITEWEBROOT}"
fi

# OVERWRITECONDADDR (empty by default): Regex to overwrite the values dependent on the remote address.
if [ -n "${OVERWRITECONDADDR:-}" ]
then
    sudo -u www-data php /var/www/html/occ config:system:set overwritecondaddr --value="${OVERWRITECONDADDR}"
fi

if [ -n "${OVERWRITECLIURL:-}" ]
then
    sudo -u www-data php /var/www/html/occ config:system:set overwrite.cli.url --value="${OVERWRITECLIURL}"
fi
