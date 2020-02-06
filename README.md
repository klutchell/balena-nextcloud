# balena-nextcloud

nextcloud stack for balenaCloud

## Requirements

* RaspberryPi3, RaspberryPi4, or a similar device supported by BalenaCloud
* Custom domain name with with configurable subdomains (eg. nextcloud.mydomain.com)
* (optional) An external drive with a partition labeled `NEXTCLOUD`
* (optional) An [external storage](https://docs.nextcloud.com/server/18/admin_manual/configuration_files/external_storage_configuration_gui.html) solution

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balena CLI.

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`NEXTCLOUD_TRUSTED_DOMAINS`|`nextcloud.mydomain.com`|space-separated list of trusted domains for remote access|
|`MYSQL_ROOT_PASSWORD`|`********`|password that will be set for the MariaDB root account|
|`MYSQL_PASSWORD`|`********`|password that will be set for the MariaDB nextcloud account|
|`TRAEFIK_CERTIFICATESRESOLVERS_TLSCHALLENGE_ACME_EMAIL`|`foo@bar.com`|email address to use for ACME registration|
|`TRAEFIK_PROVIDERS_DOCKER_DEFAULTRULE`|``Host(`{{index .Labels "subdomain"}}.mydomain.com`)``|replace `mydomain.com` with your domain managed by Cloudflare|
|`TRAEFIK_LOG_LEVEL`|`INFO`|(optional) log level for traefik|
|`TRAEFIK_CERTIFICATESRESOLVERS_TLSCHALLENGE_ACME_CASERVER`|`https://acme-staging-v02.api.letsencrypt.org/directory`|(optional) specify a different CA server to use|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|

## Usage

### fix mariadb database init

Connect to the `mariadb` Terminal and run the following:

```bash
mysql -u root -p
```

If `'root'@'localhost'` is not authenticated then the database was not initialized with our provided password.

```bash
rm -rf /var/lib/mysql/*
```

Restart the `mariadb` service to rebuild the database with defined users and passwords. Wait a few minutes for database to be ready for connections.

```bash
mysql -u root -p

SELECT User FROM mysql.user;
```

If `nextcloud` is present in the user list then the database should be ready for connections.

### fix nextcloud database warnings

Connect to the `nextcloud` terminal and run the following:

```bash
apt-get update && apt-get install sudo
sudo -u www-data ./occ db:add-missing-indices
sudo -u www-data ./occ db:convert-filecache-bigint
```

Restart the `nextcloud` service and the database warnings in Settings->Overview should be gone.

### add traefik dashboard credentials

Connect to the `traefik` Terminal and run the following:

```bash
apk add --no-cache apache2-utils
htpasswd -c /etc/traefik/.htpasswd <username>
```

Browsing to `traefik.mydomain.com` should present a login prompt.

### prepare an external drive for nextcloud

Connect to the `Host OS` Terminal and run the following:

```bash
parted -a optimal /dev/sda mklabel GPT
parted -a optimal /dev/sda mkpart NEXTCLOUD ext4 primary 2048s 100%
```

Restart the `nextcloud` service and the drive should be mounted at `/files`.

### prepare an external drive for nginx

Connect to the `Host OS` Terminal and run the following:

```bash
parted -a optimal /dev/sda mklabel GPT
parted -a optimal /dev/sda mkpart WWW ext4 primary 2048s 100%
```

Restart the `nginx` service and the files should get copied to `/usr/share/nginx/html`.

## reset nextcloud user password

Connect to the `nextcloud` Terminal and run the following:

```bash
apt-get update && apt-get install sudo
sudo -u www-data cc user:resetpassword <user>
```

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

## Acknowledgments

* <https://hub.docker.com/_/nextcloud/>
* <https://hub.docker.com/_/mariadb/>
* <https://hub.docker.com/_/traefik/>

## License

[MIT License](./LICENSE)
