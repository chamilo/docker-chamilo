from ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and PHP

RUN apt-get update && \
 apt-get install -y apache2 php libapache2-mod-php php-gd php-intl php-curl php-json php-mysql php-zip php-xml php-mbstring php-dom composer git && \
 apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Chamilo LMS
RUN mkdir /var/www/chamilo-template && \
  git clone -b 1.11.x --single-branch https://github.com/chamilo/chamilo-lms.git  /var/www/chamilo-template && \
  cd /var/www/chamilo-template && composer update && \
  chown -R www-data:www-data app main/default_course_document/images main/lang web && \
  rm -rf /var/www/chamilo-template/.git

# Prepare Apache and PHP configuration
RUN rm /var/www/html/*
COPY htaccessForChamilo.conf /etc/apache2/conf-available/
COPY php-overrides.ini /etc/php/7.2/apache2/conf.d/20-php.ini
RUN a2enconf htaccessForChamilo && \
  a2enmod rewrite && \
  sed -ri -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

COPY init-and-run.sh .

CMD ["./init-and-run.sh"]
