# Chamilo LMS — single-container runtime (PHP FPM + nginx).
#
# Slim / docker-only image: the LMS source is NOT vendored into this repo.
# It is fetched at build time from a pinned ref of chamilo/chamilo-lms, so
# the image is fully reproducible and this repo stays small.
ARG PHP_VER=8.3
FROM php:${PHP_VER}-fpm

# Pinned ref of chamilo/chamilo-lms. Bump to release a new LMS version.
# Accepts a git tag (e.g. v3.0.0-beta.2) or a full commit SHA.
ARG CHAMILO_LMS_REF=v3.0.1

# System packages + PHP extensions the LMS needs.
#   curl/ca-certificates : fetch the pinned source; Composer zip dists (TLS)
#   nginx               : serves the LMS over HTTP (front controller -> FPM)
# git is intentionally omitted — every Composer dependency in composer.lock
# ships a zip dist (no VCS-only packages), so Composer downloads archives via
# the PHP zip extension instead of cloning.
RUN apt-get update && apt-get install -y --no-install-recommends \
      curl \
      ca-certificates \
      nginx \
      libicu-dev \
      libldap-dev \
      libpng-dev \
      libonig-dev \
      libxml2-dev \
      libxslt1-dev \
      libzip-dev \
    && docker-php-ext-install -j$(nproc) \
      bcmath \
      exif \
      gd \
      intl \
      ldap \
      opcache \
      pdo \
      pdo_mysql \
      soap \
      xsl \
      zip \
    && pecl install --onlyreqdeps --force redis \
    && docker-php-ext-enable redis \
    && rm -rf /var/lib/apt/lists/*

# Web tier: drop the stock default vhost, install ours (listens on :80,
# proxies .php to PHP-FPM at 127.0.0.1:9000, docroot /app/chamilo-lms/public).
RUN rm -f /etc/nginx/sites-enabled/default \
    && rm -rf /var/www/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# PHP memory limit, split by context:
#   * build: the global CLI ini is -1 so `assets:install` (a child `php` boot
#     of the Symfony kernel, which reads the ini) can't OOM on the 128M
#     default. That line is required for the build (see AGENTS.md gotcha #1).
#   * runtime: the FPM `www` pool is bounded to 256M via php_admin_value — a
#     per-pool directive that outranks the ini — so a web request can't
#     allocate unboundedly. The -1 is NOT left in place for the web tier.
RUN echo "memory_limit=-1" > /usr/local/etc/php/conf.d/zz-memory.ini \
    && echo "php_admin_value[memory_limit] = 256M" >> /usr/local/etc/php-fpm.d/www.conf

# Fetch the LMS source, install Composer deps, and chown — ONE layer.
#
# Fetch: build-time, not vendored. The tarball extracts to a single top-level
# dir (chamilo-lms-<ref>); rename it to /app/chamilo-lms so the path is stable
# for a tag or a full SHA.
#
# Composer: two steps, one run —
#   1. full install (dev + prod) — runs `assets:install` (a dev-env kernel
#      boot, which needs the dev-only DebugBundle/WebProfilerBundle), copying
#      bundle assets into public/.
#   2. sync to prod-only (`--no-dev`), dropping dev packages (psalm, phpstan,
#      phpunit, debug/web-profiler bundles, maker-bundle, ...). `--no-scripts`
#      because re-running `assets:install` here would boot the kernel without
#      the dev bundles it needs (or, in prod, need a resolvable DB — there is
#      no DB at image-build time, so the asset step must run in step 1).
#
# Chown: the FPM `www` pool already runs as `www-data` (www.conf), but the app
# tree is root-owned, so the pool workers couldn't write to the runtime dirs
# Symfony writes constantly (var/cache, var/log, var/upload) — proven
# Permission-denied. Hand the tree to the runtime user.
#
# DO NOT split this back into separate RUNs: the `chown -R` on files that
# were written in *earlier* layers triggers an overlayfs copy-up — every file
# is duplicated into the upper layer before its metadata changes — which adds
# a ~600 MB phantom layer (image went 1.2 GB -> 1.83 GB when this was split).
# In ONE layer the chown acts on in-layer files: no copy-up.
# (No real caching is lost: a ref change rebuilds all three of these steps
# today anyway, so the work is identical — only the layer count differs.)
RUN curl -fsSL "https://github.com/chamilo/chamilo-lms/archive/${CHAMILO_LMS_REF}.tar.gz" -o /tmp/lms.tar.gz \
    && mkdir -p /app/lms-fetch \
    && tar -xzf /tmp/lms.tar.gz -C /app/lms-fetch \
    && mv /app/lms-fetch/chamilo-lms-* /app/chamilo-lms \
    && rm -f /tmp/lms.tar.gz \
    && rm -rf /app/lms-fetch /root/.cache \
    && cd /app/chamilo-lms \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-interaction --optimize-autoloader \
    && composer install --no-interaction --no-dev --no-scripts --optimize-autoloader \
    && rm -rf /root/.composer /root/.cache/composer \
    && chown -R www-data:www-data /app/chamilo-lms

WORKDIR /app/chamilo-lms

# Start PHP-FPM (daemon) + nginx (foreground, PID 1) on container start.
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80

# Liveness probe: the web tier (nginx -> FPM) is up and answering HTTP.
# Accepts ANY status code — a fresh LMS returns 5xx until the installer runs,
# and that still means the container is alive and serving. Only a connection
# failure (no response / FPM down) is "unhealthy". curl is already installed
# (source fetch); --max-time caps the wait so a stuck FPM worker can't hang.
HEALTHCHECK --start-period=15s --interval=30s --timeout=5s --retries=3 \
  CMD ["sh", "-c", "curl -s --max-time 5 -o /dev/null -w '%{http_code}' http://127.0.0.1/ 2>/dev/null | grep -qE '^[0-9]{3}$'"]
