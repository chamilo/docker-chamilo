# docker-chamilo

Single-container Docker image for the [Chamilo LMS](https://www.chamilo.org).

This image bundles **PHP 8.3-FPM** and **nginx** in one container and serves the
LMS over HTTP on port **80** (nginx → PHP-FPM on `127.0.0.1:9000`).

## How it works

The repo is **docker-only**: the LMS source is *not* vendored here. At build
time the `Dockerfile` downloads the LMS at a **pinned ref** of
[`chamilo/chamilo-lms`](https://github.com/chamilo/chamilo-lms) (a tag or a
full commit SHA, set by the `CHAMILO_LMS_REF` build arg) and installs its
Composer dependencies. The image is therefore fully reproducible, and this
repo stays small.

The container runs two processes:

| Process | Listens on      | Role |
|---------|----------------|------|
| PHP-FPM | `127.0.0.1:9000` | runs the Symfony front controller |
| nginx   | `0.0.0.0:80`     | serves static files + proxies `.php` to FPM |

## Quick start

```bash
# 1. Provide a local .env (gitignored; template in .env.example)
cp .env.example .env

# 2. Build the image and start the full stack (app + MariaDB + Redis)
docker compose up -d --build

# Open the LMS
#   http://localhost/  →  first-run installer (create the DB, then install)
```

See [SETUP.md](SETUP.md) for first-run and production notes.

## Configuration

Environment variables (read by the Symfony app — see `.env.dist` of the LMS):

| Variable           | Default | Notes |
|--------------------|---------|-------|
| `DATABASE_HOST`    | `db`    | FQDN of the database service |
| `DATABASE_PORT`    | `3306`  | |
| `DATABASE_NAME`    | `chamilo` | |
| `DATABASE_USER`    | `chamilo` | |
| `DATABASE_PASSWORD`| from `.env` | required in `.env` |
| `APP_ENV`          | `prod`  | `dev` for verbose error pages |
| `APP_SECRET`       | from `.env` | required in `.env`, 32+ chars |

> **Note:** the app reads `DATABASE_*`, not `DB_*`. Earlier compose examples
> used `DB_*`, which the LMS ignores.
>
> **Secrets:** the 4 sensitive values (`DATABASE_PASSWORD`, `MARIADB_ROOT_PASSWORD`,
> `MARIADB_PASSWORD`, `APP_SECRET`) come from a gitignored `.env`
> (template in `.env.example`). The compose uses `${VAR:?required in .env}`,
> so a missing value fails at parse time instead of silently using a weak
> default.

## Releasing a new LMS version

The version is pinned in one place — the `CHAMILO_LMS_REF` build arg in the
`Dockerfile`. To ship a new LMS version, change it to a release tag
(e.g. `v3.0.0`) or a full commit SHA, and rebuild:

```bash
docker build --build-arg CHAMILO_LMS_REF=<tag-or-sha> -t chamilo-lms .
```

## Requirements

- A MariaDB/MySQL database (provided by `docker-compose.yml` as the `db` service)
- Port 80 (HTTP)
- Optional: Redis for sessions/caching (provided as the `redis` service)

## Image size

~1.2 GB after the source fetch (LMS source + prod-only vendor + PHP 8.3 +
nginx). Dev-only Composer packages are stripped at build time (see the
Dockerfile's two-step `composer install`), and the nested `.git` of the LMS
source is excluded at build time — the old 1.2 GiB `.git` from the previous
approach is gone.
