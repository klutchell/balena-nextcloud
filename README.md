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

## Usage

### nextcloud

Once your device joins the fleet you'll need to allow some time for it to download the application and create the app database.

When it's done you should be able to access the access the app at http://nextcloud.local

Documentation for Nextcloud can be found at https://nextcloud.com/support/

### redis

Redis an in-memory key-value database that can be used to improve the performance of
applications via memory caching, where frequently-requested objects are stored in memory
for faster retrieval. I'm not a expert beyond setting it up, but some form of memory
caching is recommended for a small performance bump in applications like Bookstack
and Nextcloud. It is completely optional though, so feel free to remove it from your setup.

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.
