# docker-chamilo
Official Docker image for Chamilo LMS

This image is not ready yet. Please come back soon or watch the project for updates.

## Launching

This image is currently based on Chamilo LMS 1.10 and requires a separate database container to run.
We suggest using the "mariadb" container, like so:

```
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_USER=chamilo -e MYSQL_PASSWORD=chamilo -e MYSQL_DATABASE=chamilo -d mariadb
```

This will get you back on the command line of the Docker host. You can see the container running with ```docker ps```.

Then start the chamilo/docker-chamilo container:

```
docker run --link=mariadb:db --name chamilo -p 8080:80 -it chamilo/docker-chamilo
```

At this point, the docker-chamilo image doesn't provide an installed version of Chamilo LMS, but this should be ready soon.
