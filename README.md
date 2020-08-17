# balena-nextcloud

nextcloud stack for balenaCloud

## Requirements

- Raspberry Pi 4 or a similar x64 device supported by BalenaCloud
- External block storage device

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balenaCLI.

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

### toggle maintenance mode

Connect to the `nextcloud` terminal and run the following:

```bash
# toggle nextcloud maintenance mode
sudo -u www-data php /var/www/html/occ maintenance:mode --on
sudo -u www-data php /var/www/html/occ maintenance:mode --off
```

### enable duplicati backups

Connect to `http://<device-ip>:8200` and configure a new backup using any online service you prefer as the Destination and `/source` as Source Data.

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

[Buy me a beer](https://kyles-tip-jar.myshopify.com/cart/31356319498262:1?channel=buy_button)

[Buy me a craft beer](https://kyles-tip-jar.myshopify.com/cart/31356317859862:1?channel=buy_button)

## References

- <https://github.com/nextcloud/docker/tree/master/.examples/docker-compose>
- <https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/nextcloud>
- <https://docs.nextcloud.com/server/latest/admin_manual/installation/index.html>
- <https://docs.nextcloud.com/server/stable/admin_manual/maintenance/backup.html>

## License

[MIT License](./LICENSE)
