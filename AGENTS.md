# AGENTS.md

Playbook for AI agents (and humans) working in this repo. Read this before
touching the Dockerfile, compose, or LMS ref.

## What this repo is

A **docker-only** repo: it ships a `Dockerfile` that builds a single
**PHP 8.3-FPM + nginx** container for the Chamilo LMS. The LMS source is
**not** vendored — it is **fetched at build time** at a pinned ref of
`chamilo/chamilo-lms` (the `CHAMILO_LMS_REF` build arg). Do **not** commit
the LMS source tree here; that bloats the repo and defeats the slim design.

## Key files

| File | Purpose |
|------|---------|
| `Dockerfile` | Builds the image. Fetches LMS at `CHAMILO_LMS_REF`, installs deps + nginx, sets up FPM. |
| `nginx.conf` | The vhost: serves `public/` statics, proxies `.php` to FPM `127.0.0.1:9000`. |
| `entrypoint.sh` | Starts `php-fpm` (bg) then `exec nginx` (PID 1). |
| `docker-compose.yml` | `chamilo` + `db` (MariaDB 11) + `redis` (Redis 7). |
| `.dockerignore` | Keeps the build context lean (docs, VCS, logs). |

## Build

```bash
# Default: pinned ref from the Dockerfile
docker build -t chamilo-lms .

# Override the LMS ref (tag or full 40-char SHA)
docker build --build-arg CHAMILO_LMS_REF=v3.0.0 -t chamilo-lms .
```

Build is **slow the first time** (~88 MB source tarball + Composer fetch);
later builds are cached. Use `podman` if that's the host runtime.

## Run

```bash
docker compose up -d --build
# → http://localhost/  (first-run installer)
```

Verify the wiring is live (no DB yet, so expect the installer / a Symfony
error page — that **proves** nginx → FPM → PHP is connected):

```bash
curl -s -o /dev/null -w "%{http_code}\n" http://localhost/   # 200/3xx/5xx = wired
docker exec chamilo php -r 'exit((@fsockopen("127.0.0.1",9000)!==false)?0:1);' && echo "FPM up"
docker exec chamilo nginx -t   # vhost is valid
```

## Gotchas (do not re-learn these the hard way)

1. **`memory_limit` OOM — split by context.** Symfony's `assets:install`
   post-install script boots the kernel in a child `php` process and
   exhausts PHP's 128 M default. The Dockerfile writes `memory_limit=-1` to
   `/usr/local/etc/php/conf.d/zz-memory.ini` **for the build** — the child reads
   the ini, and if you override memory the build OOMs in
   `PhpConfigReferenceDumpPass`. It **also** bounds the runtime FPM `www` pool
   to `256M` via `php_admin_value[memory_limit]` appended to
   `/usr/local/etc/php-fpm.d/www.conf` — a per-pool directive that outranks the
   ini — so a web request can't allocate unboundedly. **Do not remove either
   part:** the build needs the `-1` ini, and the pool limit is what keeps the
   runtime from running unlimited.
2. **Nested `.git` bloat.** The old approach copied the LMS tree (with its
   1.2 GiB `.git`) into the image. This repo fetches a **tarball** (no `.git`),
   so the image is ~1.2 GB. If you ever add a `COPY` of a source tree, you
   **must** `.dockerignore` the nested `.git`.
3. **Env var names.** The app reads **`DATABASE_*`** (see `.env.dist` of the
   LMS), **not** `DB_*`. The compose sets `DATABASE_HOST=db` etc. Renaming
   these breaks the DB connection. The 4 sensitive values
   (`DATABASE_PASSWORD`, `MARIADB_ROOT_PASSWORD`, `MARIADB_PASSWORD`,
   `APP_SECRET`) are read from a gitignored `.env` (template in `.env.example`);
   the compose uses `${VAR:?required in .env}`, so a missing value fails at
   parse time. **Do not commit `.env` or hard-code the values back into
   `docker-compose.yml`.** The `.env` mechanism (not a native `secrets:`
   block) is the portable choice because the `mariadb:11` image reads
   `MARIADB_ROOT_PASSWORD` from env, not from a Docker secret file.
4. **FPM is on `9000`, nginx on `80`.** nginx proxies `.php` to
   `127.0.0.1:9000`. If you change the FPM port, update **both**
   `nginx.conf` (`fastcgi_pass`) and the `entrypoint.sh` readiness check.
5. **`entrypoint.sh` runs as root** (the image default). It must start FPM
   before nginx or early requests 502. The readiness loop uses PHP's
   `fsockopen` (no extra tools needed).
6. **No TLS.** The image speaks plain HTTP on :80. Terminate TLS in front of
   it (reverse proxy / load balancer) for production.

## Releasing a new LMS version

Change **one** thing — the `CHAMILO_LMS_REF` build arg in the `Dockerfile`
(to a tag like `v3.0.1` or a full commit SHA), commit, and rebuild. Prefer a
release **tag** for reproducible public builds; a moving SHA is fine for
pinning "our exact current tree".

## Repo hygiene

- Keep it **slim**: no LMS source, no `vendor/`, no build artifacts.
- Keep `.dockerignore` covering `.git`, `.github`, `*.log`, `tmp/`, and a
  blanket `*.md` for the docs (they're for humans, not the build).
- The old `000-default.conf` (Apache vhost) was removed — this image is
  nginx + FPM, not Apache mod_php. Don't reintroduce Apache.
