# balena-nextcloud

nextcloud stack for balenaCloud

## Requirements

* RaspberryPi3, RaspberryPi4, or a similar device supported by BalenaCloud
* Custom domain name with with configurable subdomains (eg. nextcloud.mydomain.com)
* a USB drive with an ext4 partition labeled `NEXTCLOUD` (it will be auto mounted on boot)

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balena CLI.

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|
|`TRAEFIK_CERTIFICATESRESOLVERS_TLSCHALLENGE_ACME_EMAIL`|`foo@bar.com`|(required) email address to use for ACME registration|
|`TRAEFIK_PROVIDERS_DOCKER_DEFAULTRULE`|``Host(`{{index .Labels "subdomain"}}.mydomain.com`)``|(required) replace `mydomain.com` with your domain managed by Cloudflare|
|`TRAEFIK_LOG_LEVEL`|`INFO`|(optional) log level for traefik|
|`TRAEFIK_CERTIFICATESRESOLVERS_TLSCHALLENGE_ACME_CASERVER`|`https://acme-staging-v02.api.letsencrypt.org/directory`|(optional) specify a different CA server to use|
|`NEXTCLOUD_TRUSTED_DOMAINS`|`nextcloud.mydomain.com`|(required) space-separated list of trusted domains for remote access|
|`MYSQL_ROOT_PASSWORD`|`********`|(required) password that will be set for the MariaDB root account|
|`MYSQL_PASSWORD`|`********`|(required) password that will be set for the MariaDB nextcloud account|

## Usage

### prepare storage

Connect to the `Host OS` Terminal and run the following:

```bash
mkfs.ext4 /dev/sda1 -L NEXTCLOUD
```

### check database init state

Connect to the `mariadb` Terminal and run the following:

```bash
mysql -u root -p

SELECT User FROM mysql.user;
```

### unlock traefik dashboard

Connect to the `traefik` Terminal and run the following:

```bash
apk add --no-cache apache2-utils
htpasswd -c /etc/traefik/.htpasswd <username>
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
