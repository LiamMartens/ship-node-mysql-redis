#!/bin/bash
export HOME=/home/www-data

# set timezone
cat /usr/share/zoneinfo/$TIMEZONE > /etc/localtime
echo $TIMEZONE > /etc/timezone

exec "$@"