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

The configuration files assume the host will be "docker.chamilo.net", so you will have to define it in your host's /etc/hosts file, depending on the IP of the container.

```
72.17.0.10 docker.chamilo.net
```

Now start your browser and load http://docker.chamilo.net.

## Using with a load-balancer

If you want to use a more complex system with load balancing, you might want to try out the following suite of commands:

```
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_USER=chamilo -e MYSQL_PASSWORD=chamilo -e MYSQL_DATABASE=chamilo -d mariadb
docker run --link=mariadb:db --name chamilo -p 8080:80 -it chamilo/docker-chamilo
# configure Chamilo on this first container then take a snapshot
docker commit -m "Live running Chamilo connected to host 'db' with existing database" {container-hash} docker-chamilo:live
docker run --link=mariadb:db --name chamilo2 -p 8081:80 -it docker-chamilo:live
docker run --name lb --link=chamilo:w1 --link=chamilo4:w2 -e CHAMILO_1_PORT_80_TCP_ADDR=172.17.0.10 -e CHAMILO_2_PORT_80_TCP_ADDR=172.17.0.11 -e CHAMILO_HOSTNAME=docker.chamilo.net -e CHAMILO_PATH=/ -p 8082:80 -it jasonwyatt/nginx-loadbalancer
```

Sadly, there's something wrong at the moment in the nginx-loadbalancer image, and you have to connect to it to change the configuration of the reverse proxy (the last container you launched).

```
docker ps
```

(to identify the hash of the image of the load balancer (lb))

```
docker exec -i -t 87895b732246 bash
cd /etc/nginx/sites-available/
vi proxy.conf
```

(add the following *just before* proxy_pass, in the two occurrences)

```
  proxy_set_header Host $host;
  proxy_set_header X-Real-IP $remote_addr;
```

Now reload Nginx

```
service nginx reload
```

Now you should be good to go.

Note that this will only work as long as you don't upload any file or object that needs to be stored on disk, as the two web servers will not share any disk space in the context presented above.
