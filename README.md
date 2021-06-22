# docker-chamilo
"Official" Docker build for Chamilo LMS

This Dockerfile is to build a Chamilo 1.11.14 default instalation docker image.
This a Pre Beta/Alpha build and is not and never wil be intended for Production enviorments, for that a dedicated server would be recommended.
**This is not a ready Docker Image for that look here: **

## Building

This Build is currently based on Chamilo LMS 1.11.14  
To build the image run:
```
docker-compose build in the main directory.
```
Then you can run it like:
```
docker run -p 80:80 -p 22:22 spacecabbie/chamilo-lms:1.11.14-Alpha
```

Now start your browser and load http://localhost

## Using with a load-balancer The information below is outdated and needs updating this wil be done soon.

If you want to use a more complex system with load balancing, you might want to try out the following suite of commands:

```
docker run --name varwww -d ywarnier/varw
```

This will provide a shared /var/www2 partition

```
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_USER=chamilo -e MYSQL_PASSWORD=chamilo -e MYSQL_DATABASE=chamilo -d mariadb
docker run --link=mariadb:db --volumes-from=varwww --name chamilo -p 8080:80 -it chamilo/docker-chamilo
# Change all configuration to point to /var/www2/chamilo/www and change the Chamilo config file (root_web)
# Also, inside app/config/configuration.php, change "session_stored_in_db" to true
# configure Chamilo on this first container then take a snapshot
docker commit -m "Live running Chamilo connected to host 'db' with existing database" {container-hash} docker-chamilo:live
docker run --link=mariadb:db --volumes-from=varwww --name chamilo2 -p 8081:80 -it docker-chamilo:live
docker run --name lb --link=chamilo:w1 --link=chamilo4:w2 -e CHAMILO_1_PORT_80_TCP_ADDR=172.17.0.10 -e CHAMILO_2_PORT_80_TCP_ADDR=172.17.0.11 -e CHAMILO_HOSTNAME=docker.chamilo.net -e CHAMILO_PATH=/ -p 8082:80 -it jasonwyatt/nginx-loadbalancer
```

Sadly, there's something wrong at the moment in the nginx-loadbalancer image, and you have to connect to it to change the configuration of the reverse proxy (the last container you launched).

```
docker ps
```

(to identify the hash of the image of the load balancer (lb))

```
docker exec -i -t {lb-container-hash} bash
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
