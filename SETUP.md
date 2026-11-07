# Setup

First-run and production notes for the `docker-chamilo` image.

## What's in the image

- **PHP 8.3-FPM** (the `www` pool on `127.0.0.1:9000`)
- **nginx** (HTTP on `:80`) — the web tier
- The **Chamilo LMS** source, fetched at build time at a pinned ref
  (`CHAMILO_LMS_REF` in the `Dockerfile`)
- Composer dependencies + the Symfony `assets:install` step, already run

The container starts both PHP-FPM and nginx via `entrypoint.sh`; nginx is
PID 1.

## Bring up the full stack

```bash
# 1. Provide a local .env (gitignored; template in .env.example)
cp .env.example .env

# 2. Start the full stack (app + MariaDB + Redis)
docker compose up -d --build
```

This starts three services (see `docker-compose.yml`):

- `chamilo` — the app (HTTP :80)
- `db` — MariaDB 11
- `redis` — Redis 7 (sessions/cache)

Then open **http://localhost/** — the LMS **first-run installer** walks you
through creating the database, the admin account, and completing the install.

> The app reads `DATABASE_*` environment variables (see `.env.dist` of the
> LMS), **not** `DB_*`. The compose file sets `DATABASE_HOST=db`, etc.

## Database

The `db` service pre-creates a database and user (values read from `.env` —
template in `.env.example`, gitignored):

| Item | Value |
|------|-------|
| Root password | `chamilo` (dev default) |
| Database | `chamilo` |
| User | `chamilo` |
| Password | `chamilo` (dev default) |

The compose uses `${VAR:?required in .env}`, so a missing `.env` fails at parse
time instead of silently using a weak default. For a real deployment, set
strong values in `.env`.

For an existing database, point `DATABASE_*` at it instead.

## Production checklist

- Set a strong `APP_SECRET` (32+ chars).
- Terminate TLS **in front of** this container (a reverse proxy / load
  balancer) — this image speaks plain HTTP on :80.
- Use a real `DATABASE_PASSWORD` and a non-root DB user.
- Back up the `db_data` volume (and `chamilo_data` for uploads).
- Pin `CHAMILO_LMS_REF` to a release tag (not a moving SHA) for
  reproducible builds.
- Consider `APP_ENV=prod` (default) and disabling the debug error handler.

## Releasing a new LMS version

The version lives in one place — the `CHAMILO_LMS_REF` build arg in the
`Dockerfile`:

```bash
# ship a stable release
docker build --build-arg CHAMILO_LMS_REF=v3.0.0 -t chamilo-lms .

# or pin an exact commit
docker build --build-arg CHAMILO_LMS_REF=<full-40-char-sha> -t chamilo-lms .
```

Rebuild and re-run `docker compose up -d --build`. The pinned ref changes
what source is fetched; everything else (PHP, extensions, nginx config) is
unchanged.

## Troubleshooting

- **502 / 504 from nginx** — FPM isn't up. Check `docker logs chamilo` for
  the `entrypoint.sh` startup; FPM must accept on `:9000` before nginx
  proxies.
- **DB connection errors** — confirm the `chamilo` service can reach `db`
  (same compose network) and that `DATABASE_*` matches the `db` service.
- **`memory_limit` OOM during build** — the Dockerfile sets
  `memory_limit=-1`; if you override it, `assets:install` will OOM on the
  128 M default.
- **Slow first build** — the source is downloaded at build time (~88 MB
  tarball) and Composer deps are fetched; subsequent builds are cached.
