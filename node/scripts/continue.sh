#!/bin/bash
export HOME=/home/www-data

npm config set prefix /home/www-data/.node_modules
export PATH=/home/www-data/.node_modules/bin:$PATH


# set timezone
cat /usr/share/zoneinfo/$TIMEZONE > /etc/localtime
echo $TIMEZONE > /etc/timezone

exec "$@"