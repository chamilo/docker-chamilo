FROM ubuntu:14.04
MAINTAINER Yannick Warnier <ywarnier@chamilo.org>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Update Ubuntu and install basic PHP stuff
RUN apt-get -y update && apt-get install -y \
  curl \
  git \
  libapache2-mod-php5 \
  php5-cli \
  php5-curl \
  php5-gd \
  php5-intl \
  php5-mysql \
  wget

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Get Chamilo
RUN mkdir -p /var/www/chamilo
ADD https://github.com/chamilo/chamilo-lms/archive/v1.10.0-alpha.tar.gz /var/www/chamilo/chamilo.tar.gz
WORKDIR /var/www/chamilo
RUN tar zxf chamilo.tar.gz;rm chamilo.tar.gz;mv chamilo* www
WORKDIR www
RUN chown -R www-data:www-data \
  app \
  main/default_course_document/images \
  main/lang \
  vendor \
  web

# Get Composer (putting the download in /root is discutible)
WORKDIR /root
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer

# Get Chash
RUN git clone https://github.com/chamilo/chash.git chash
WORKDIR chash
RUN composer update --no-dev
RUN php -d phar.readonly=0 createPhar.php
RUN chmod +x chash.phar && mv chash.phar /usr/local/bin/chash

# Configure and start Apache
ADD chamilo.conf /etc/apache2/sites-available/chamilo.conf
RUN a2ensite chamilo
RUN a2enmod rewrite
RUN /etc/init.d/apache2 restart
RUN echo "127.0.0.1 docker.chamilo.net" >> /etc/hosts

# Go to Chamilo folder and install
# Soon... (this involves having a SQL server in a linked container)

WORKDIR /var/www/chamilo/www
EXPOSE 22 80
CMD ["/bin/bash"]
