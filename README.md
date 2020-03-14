# docker-chamilo
Official Docker image for Chamilo LMS

The image is based on Chamilo LMS 1.11 and uses Apache as web server.

## Launching for a quick demo

**Hint: You will loose data when stopping the containers.**

We need to start a MariaDB database and the Chamilo docker image.

We suggest using the "mariadb" container, like so:

```
docker run --name chamilo-db -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_USER=chamilo -e MYSQL_PASSWORD=chamilo -e MYSQL_DATABASE=chamilo -d mariadb:10-bionic
```

See https://hub.docker.com/_/mariadb/ for more options.

Now start the Chamilo image, linked to the database container.

```
docker run --link=chamilo-db:db --name chamilo -p 8080:80 -d chamilo/docker-chamilo
```

Now start your browser and load http://my_docker_ip:8080.

Hint:

In the initial setup use the following values:

* URL of the application is the IP of your docker server.
* host of the database is defined by the *--link* option: db
* username and password are defined in the docker run command of the database. See above.

## Launching with various options

**Persistent volumes for the database and the Chamilo configuration**

Create a data directory on a suitable volume on your host system, e.g.

    mkdir /my/chamilo/db
    mkdir /my/chamilo/config


Start your mariadb container like this:

```
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_USER=chamilo -e MYSQL_PASSWORD=chamilo -e MYSQL_DATABASE=chamilo -v /my/chamilo/db:/var/lib/mysql -d mariadb:10-bionic
```

```
docker run --link=chamilo-db:db --name chamilo -p 8080:80 -d -v /my/chamilo/config:/var/www/html/app/config/  chamilo/docker-chamilo
```

**Using your own timezone**

```
docker run -e TZ=Europe/Berlin --link=chamilo-db:db --name chamilo -p 8080:80 -d chamilo/docker-chamilo
```
