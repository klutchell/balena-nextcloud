# balena-nextcloud

nextcloud stack for balenaCloud

## Requirements

- Raspberry Pi 4 or a similar x64 device supported by BalenaCloud
- External block storage device

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![](https://balena.io/deploy.png)](https://dashboard.balena-cloud.com/deploy)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application, flashing a device, downloading the project and pushing it via either Git or the [balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|
|`MYSQL_ROOT_PASSWORD`|`********`|password that will be set for the MariaDB root account|
|`MYSQL_PASSWORD`|`********`|password that will be set for the MariaDB nextcloud account|

## Usage

### prepare external storage

Connect to the `Host OS` Terminal and run the following:

```bash
# g - create a new empty GPT partition table
# n - add a new partition
# 1 - partition number 1
# default - start at beginning of disk
# default - extend partition to end of disk
# y - overwrite existing filesystem
# w - write the partition table
printf "g\nn\n1\n\n\ny\nw\n" | fdisk /dev/sda
mkfs.ext4 /dev/sda1 -L NEXTCLOUD
```

Restart the `nextcloud` service and the new partition with `LABEL=NEXTCLOUD` will be mounted at `/data`.

### add trusted domains

```bash
sudo -u www-data php /var/www/html/occ maintenance:mode --on
sudo -u www-data php /var/www/html/occ config:system:set trusted_domains 0 --value='*.balena-devices.com'
sudo -u www-data php /var/www/html/occ config:system:set trusted_domains 1 --value='nextcloud.example.com'
sudo -u www-data php /var/www/html/occ maintenance:mode --off
```

### add trusted proxies

```bash
sudo -u www-data php /var/www/html/occ maintenance:mode --on
sudo -u www-data php /var/www/html/occ config:system:set trusted_proxies 0 --value='localhost'
sudo -u www-data php /var/www/html/occ config:system:set trusted_proxies 1 --value='traefik'
sudo -u www-data php /var/www/html/occ maintenance:mode --off
```

### set overwrite values

```bash
sudo -u www-data php /var/www/html/occ maintenance:mode --on
sudo -u www-data php /var/www/html/occ config:system:set overwriteprotocol --value='https'
sudo -u www-data php /var/www/html/occ config:system:set overwrite.cli.url --value='https://nextcloud.example.com/'
sudo -u www-data php /var/www/html/occ config:system:set overwritehost --value='nextcloud.example.com'
sudo -u www-data php /var/www/html/occ maintenance:mode --off
```

### duplicati

Connect to `http://<device-ip>:8200` to begin using duplicati.

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

[![](https://cdn.buymeacoffee.com/buttons/default-orange.png)](https://www.buymeacoffee.com/klutchell)

## References

- <https://github.com/nextcloud/docker/tree/master/.examples/docker-compose>
- <https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/nextcloud>
- <https://docs.nextcloud.com/server/stable/admin_manual/installation/index.html>
- <https://docs.nextcloud.com/server/stable/admin_manual/installation/nginx.html>
- <https://docs.nextcloud.com/server/stable/admin_manual/maintenance/backup.html>

## License

[MIT License](./LICENSE)
