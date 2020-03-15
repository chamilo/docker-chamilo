#!/bin/bash

# copy template on first run
if [ ! -d "/var/www/html/main" ]; then
  echo "First run: move Chamilo LMS to web folder. Wait ..."
  cp -rT -p /var/www/chamilo-template /var/www/html
  rm -rf /var/www/chamilo-template
fi

echo "Starting Apache Webserver"

apachectl -D FOREGROUND
