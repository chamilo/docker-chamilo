FROM ubuntu:15.10
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
  php5-mysqlnd \
  php5-json \
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
RUN git clone --depth=1 --single-branch -b 1.10.x https://github.com/chamilo/chamilo-lms.git www
WORKDIR www
RUN rm -rf vendor web composer.lock
RUN git clone --depth=1 --single-branch -b 1.10.x https://github.com/ywarnier/chamilo-vendors import
RUN mv import/vendor vendor
RUN mv import/web web
RUN mv import/composer.lock composer.lock
RUN rm -rf import

# Get Composer (putting the download in /root is discutible)
WORKDIR /root
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer

# Get Chash
RUN git clone https://github.com/chamilo/chash.git chash
WORKDIR chash
RUN composer global require "fxp/composer-asset-plugin:1.0.3"
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
#RUN chash chash:chamilo_install \
#  --no-interaction \
#  --sitename="Chamilo" \
#  --site_url="http://docker.chamilo.net/" \
#  --institution="Chamilo" \
#  --institution_url="https://chamilo.org" \
#  --encrypt_method="sha1" \
#  --firstname="John" \
#  --lastname="Doe" \
#  --language="english" \
#  --driver="pdo_mysql" \
#  --host="127.0.0.1" \
#  --port="3306" \
#  --dbname="chamilo" \
#  --dbuser="root" \
#  --dbpassword="chamilo" \
#  --permissions_for_new_directories="0777" \
#  --permissions_for_new_files="0666" \
#  --linux-user="www-data" \
#  --linux-group="www-data" \
#  --username="admin" \
#  --password="admin" \
#  --email="admin@example.com" \
#  --phone="555-5555" \
#  1.10.x
#
EXPOSE 22 80
CMD ["/bin/bash"]
