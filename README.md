# balena-nextcloud

[Nextcloud](https://nextcloud.com/) is a safe home for all your data.
Access & share your files, calendars, contacts, mail & more from any device, on your terms.

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/klutchell/balena-nextcloud&defaultDeviceType=raspberrypi4-64)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application, flashing a device, downloading the project and pushing it via either Git or the [balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Default|Purpose|
|---|---|---|
|`TZ`||Inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location.|
|`MYSQL_ROOT_PASSWORD`|(required)|Password that will be set for the MariaDB root account.|

## Usage

### nextcloud

Connect to `http://<device-ip>:80` or enable the Public Device URL on the
balena Dashboard to create an admin user and begin using Nextcloud.

<https://docs.nextcloud.com/server/stable/admin_manual/contents.html>

### redis

Redis an in-memory key-value database that can be used to improve the performance of
applications via memory caching, where frequently-requested objects are stored in memory
for faster retrieval. I'm not a expert beyond setting it up, but some form of memory
caching is recommended for a small performance bump in applications like Bookstack
and Nextcloud. It is completely optional though, so feel free to remove it from your setup.

### sqldump

The `sqldump` service will run every hour and take a snapshot of the mysql database.
This snapshot is more likely to be recovered from a backup than an in-use database file.

I don't trust a backup of a database that is currently in use, so sqldump ensures there
is no corruption due to open database files.
On restoration if the database doesn't immediately work, I can import the sqldump file.

<https://mariadb.com/kb/en/mysqldump/#restoring>

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.
