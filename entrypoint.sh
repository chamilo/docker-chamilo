#!/bin/sh
# Single-container entrypoint: start PHP-FPM (background) then hand PID 1 to nginx.
# nginx proxies PHP to FPM on 127.0.0.1:9000 (see nginx.conf).
set -e

# The www pool (php:8.3-fpm default) listens on 9000.
php-fpm &

# Wait until FPM accepts connections before nginx starts proxying to it.
until php -r 'exit((@fsockopen("127.0.0.1",9000) !== false) ? 0 : 1);' 2>/dev/null; do
    sleep 0.2
done

# Hand PID 1 to nginx so SIGTERM/SIGQUIT reach it cleanly for graceful stop.
exec nginx -g "daemon off;"
