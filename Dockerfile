FROM ubuntu:16.04
MAINTAINER Yannick Warnier <ywarnier@chamilo.org>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Update Ubuntu and install basic PHP stuff
RUN apt-get -y update && apt-get install -y \
  curl \
  git \
  libapache2-mod-php7.0 \
  php7.0-cli \
  php7.0-curl \
  php7.0-gd \
  php7.0-intl \
  php7.0-mbstring \
  php7.0-mcrypt \
  php7.0-mysql \
  php7.0-zip \
  wget

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Install MySQL
RUN apt-get install debconf-utils
RUN echo "mysql-server mysql-server/root_password password chamilo" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password chamilo" | debconf-set-selections
RUN apt-get -y install mysql-server mysql-client

# Get Chamilo
RUN mkdir -p /var/www/chamilo
WORKDIR /var/www/chamilo
RUN git clone --depth=1 --single-branch -b 1.11.x https://github.com/chamilo/chamilo-lms.git www
WORKDIR www
RUN rm -rf vendor/* web/* composer.lock

# Get Composer and update Chamilo (putting the download in /root is discutible)
WORKDIR /root
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer
WORKDIR /var/www/chamilo/www
RUN composer update -n

# Get Chash
RUN git clone https://github.com/chamilo/chash.git chash
WORKDIR chash
RUN rm -rf vendor
RUN git clone https://github.com/ywarnier/chash-vendors.git vendors
RUN mv vendors/vendor vendor
RUN rm -rf vendors
RUN php -d phar.readonly=0 createPhar.php
RUN chmod +x chash.phar && mv chash.phar /usr/local/bin/chash

# Add datetime setting to php.ini
RUN echo "date.timezone = Europe/Brussels" >> /etc/php5/apache2/php.ini
RUN echo "date.timezone = Europe/Brussels" >> /etc/php5/cli/php.ini

# Configure and start Apache
ADD chamilo.conf /etc/apache2/sites-available/chamilo.conf
RUN a2ensite chamilo
RUN a2enmod rewrite
#RUN a2enmod rewrite headers expires ssl
RUN echo "127.0.0.1 docker.chamilo.net" >> /etc/hosts
RUN /etc/init.d/apache2 restart

# Go to Chamilo folder and install
# Soon... (this involves having a SQL server in a linked container)
WORKDIR /var/www/chamilo/www
RUN chown -R www-data:www-data \
  app \
  main/default_course_document/images \
  main/lang \
  vendor \
  web

EXPOSE 22 80
CMD ["/bin/bash"]
