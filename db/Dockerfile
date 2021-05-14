FROM yobasystems/alpine-mariadb:10.5.9

# Abuse the healthcheck cmd by having it backup our database on a schedule.
# This is cleaner than installing a separate cron/timer service in the image.
# It also has less overhead than running a separate sqldump container/service.
# However this is NOT what healtchecks were designed to do so this is a hack.
# For now run the backup every 10 minutes and keep 1 per each day of the week.
# How to restore: <https://mariadb.com/kb/en/mysqldump/#restoring>
HEALTHCHECK --interval=10m --timeout=30s --start-period=30m --retries=3 \
	CMD mysqldump -uroot -p"${MYSQL_ROOT_PASSWORD}" --all-databases --result-file="/var/lib/mysql/backup$(date '+%u').sql"

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
