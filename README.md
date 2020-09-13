# docker-chamilo

Official Docker image for Chamilo LMS

This image is not ready yet. Please come back soon or watch the project for updates.

## Build docker image

This process will download chamilo-lms and other components from github and build an image on your cocker host machine.  

Some values can be passed as --build-arg and later as environment variables.  

```bash
docker build -t chamilo/docker-chamilo:1.11.12 \
  --build-arg MYSQL_ROOT_PASSWORD="pass" \
  --build-arg FQDN="chamilo.example.net" \
  --build-arg TZ="Europe/Brussels" \
  --build-arg APACHE_LOG_DIR="/var/log/apache2" \
  .
```

## Launching

This image is currently based on Chamilo LMS 1.10 and requires a separate database container to run.
We suggest using the "mariadb" container, like so:

```bash
docker run -d \
  --name chamilo-db \
  --hostname chamilo-db \
  --domainname example.net \
  -e MYSQL_ROOT_PASSWORD=pass \
  -e MYSQL_USER=chamilo \
  -e MYSQL_PASSWORD=chamilo \
  -e MYSQL_DATABASE=chamilo \
  mariadb
```

This will get you back on the command line of the Docker host. You can see the container running with:

```bash
docker ps
```

Then start the chamilo/docker-chamilo container:  

Please note that you'll hace to customize settings before building the image, work still have to be done to hace ENV variables override all resources when docker run gets exetuted.

```bash
docker run -d \
  --name chamilo \
  --hostname chamilo \
  --domainname example.net \
  --link=chamilo-db \
  -p 80 \
  chamilo/docker-chamilo:1.11.12
```

At this point, the docker-chamilo image doesn't provide an installed version of Chamilo LMS, but this should be ready soon.

The configuration files assume the host will be "chamilo.example.net", so you will have to define it in your host's /etc/hosts file, depending on the IP of the container.

```bash
72.17.0.10 chamilo.example.net
```

Now start your browser and load <http://chamilo.example.net>

## Using with a load-balancer

If you want to use a more complex system with load balancing, you might want to try out the following suite of commands:

```bash
docker run -d \
  --name=varwww \
  ywarnier/varw
```

This will provide a shared /var/www2 partition.

To avoid conflicts with the containers created above we will start a new database container

```bash
docker run -d \
  --name=chamilo-db_lb \
  --hostname=chamilo-db_lb \
  --domainname=example.net \
  -e MYSQL_ROOT_PASSWORD=pass \
  -e MYSQL_USER=chamilo \
  -e MYSQL_PASSWORD=chamilo \
  -e MYSQL_DATABASE=chamilo \
  mariadb
```

```bash
docker run -d \
  --name=chamilo_lb-n1 \
  --hostname=chamilo_lb-n1 \
  --domainname=example.net \
  --link=chamilo-db_lb \
  --volumes-from=varwww \
  -p 80 \
  chamilo/docker-chamilo:1.11.12
```

### Some extra Configuration

Change all configuration to point to /var/www2/chamilo/www and change the Chamilo config file (root_web)  
Also, inside app/config/configuration.php, change "session_stored_in_db" to true  
configure Chamilo on this first container then take a snapshot  

```bash
docker commit -m "Live running Chamilo connected to host 'db' with existing database" {container-hash} docker-chamilo:live
```

### Start another container

```bash
docker run -d \
  --name=chamilo_lb-n2 \
  --hostname=chamilo_lb-n2 \
  --domainname=example.net \
  --link=chamilo-db_lb \
  --volumes-from=varwww \
  -p 80 \
  docker-chamilo:live
```

### Start the load-balancer

```bash
docker run -it \
  --name lb \
  --link=chamilo_lb-n1:w1 \
  --link=chamilo_lb-n2:w2 \
  -e CHAMILO_1_PORT_80_TCP_ADDR=172.17.0.10 \
  -e CHAMILO_2_PORT_80_TCP_ADDR=172.17.0.11 \
  -e CHAMILO_HOSTNAME=chamilo.example.net \
  -e CHAMILO_PATH=/ \
  -p 80 \
  jasonwyatt/nginx-loadbalancer
```

Sadly, there's something wrong at the moment in the nginx-loadbalancer image, and you have to connect to it to change the configuration of the reverse proxy (the last container you launched).

```bash
docker ps
```

(to identify the hash of the image of the load balancer (lb))

```bash
docker exec -it {lb-container-hash} /bin/bash
cd /etc/nginx/sites-available/
vi proxy.conf
```

(add the following *just before* proxy_pass, in the two occurrences)

```bash
  proxy_set_header Host $host;
  proxy_set_header X-Real-IP $remote_addr;
```

Now reload Nginx

```bash
service nginx reload
```

Now you should be good to go.

Note that this will only work as long as you don't upload any file or object that needs to be stored on disk, as the two web servers will not share any disk space in the context presented above.
