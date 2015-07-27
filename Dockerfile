FROM ubuntu:14.04
MAINTAINER Yannick Warnier <ywarnier@chamilo.org>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Update Ubuntu and install basic PHP stuff
RUN apt-get -y update && apt-get install -y libapache2-mod-php5 php5-mysql php5-intl php5-gd php5-cli wget curl php5-curl git

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Get Chamilo
RUN mkdir -p /var/www/chamilo
ADD https://github.com/chamilo/chamilo-lms/archive/v1.10.0-alpha.tar.gz /var/www/chamilo/chamilo.tar.gz
RUN cd /var/www/chamilo;tar zxf chamilo.tar.gz;mv chamilo-lms-1.10.0-alpha www
RUN cd /var/www/chamilo/www;chown -R www-data:www-data app main/default_course_document/images main/lang vendor web

# Get Composer (putting the download in /root is discutible)
RUN cd /root
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer

# Get Chash
RUN cd /root
RUN git clone https://github.com/chamilo/chash.git /root/chash
RUN cd /root/chash
RUN composer update --no-dev
RUN php -d phar.readonly=0 createPhar.php
RUN chmod +x chash.phar
RUN mv chash.phar /usr/local/bin/chash

# Go to Chamilo folder and install
# Soon... (this involves having a SQL server in a linked container)

EXPOSE 22 80
CMD ["/bin/bash"]
