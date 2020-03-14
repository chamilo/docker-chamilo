#!/bin/bash

# copy template on first run

if [ ! -d "/var/www/html/app" ]; then
  echo "First run: move Chamilo LMS to web folder. Wait ..."
  cp -r -p /var/www/chamilo-template/* /var/www/html/
  rm -rf /var/www/chamilo-template
fi

echo "Starting Apache Webserver"

apachectl -D FOREGROUND
