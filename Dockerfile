FROM ubuntu:20.04
LABEL author="Yannick Warnier <ywarnier@chamilo.org>"
LABEL contributor="Diego Bendlin <diego.bendlin@gmail.com>"

ARG MYSQL_ROOT_PASSWORD
ARG FQDN
ARG TZ 
ARG APACHE_LOG_DIR 
# Environment section
ENV FQDN ${FQDN}
ENV TZ ${TZ}
ENV APACHE_LOG_DIR ${APACHE_LOG_DIR}

# Configure Timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Update Ubuntu and install all required packages
RUN apt-get -y update && apt-get install -y apt-utils
RUN apt-get install -y apache2 mysql-client php \
  libapache2-mod-php php-mysqlnd php-mysql \
  php-xml php-json php-iconv php-gd php-intl php-mbstring \
  php-ctype php-ldap php-curl php-xsl php-zip php-fpm \
  git composer curl nano unzip debconf-utils gettext-base iputils-ping net-tools

# Configure MySQL
RUN echo "mysql-server mysql-server/root_password password ${MYSQL_ROOT_PASSWORD}" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password ${MYSQL_ROOT_PASSWORD}" | debconf-set-selections

# Add datetime setting to php.ini
RUN echo "date.timezone = ${TZ}" >> /etc/php/7.4/apache2/php.ini
RUN echo "date.timezone = ${TZ}" >> /etc/php/7.4/cli/php.ini

# Get Chamilo from Github
WORKDIR /var/www
RUN git clone --depth=1 -b feature/improvedLdapIntegration https://github.com/dbendlin/chamilo-lms.git

# Go to Chamilo folder and update composer resources
WORKDIR /var/www/chamilo-lms
# Change permissions
RUN mkdir -p vendor && mkdir -p web
RUN chown -R www-data:www-data app main/default_course_document/images main/lang vendor web
RUN chmod 0775 -R app main/default_course_document/images main/lang web && chmod 0555 -R vendor
RUN composer update -n

# Configure and start Apache
RUN echo "ServerName ${FQDN}" >> /etc/apache2/apache2.conf
RUN echo "127.0.0.1 ${FQDN}" >> /etc/hosts
## Enable Rewrite module
RUN a2enmod rewrite
#RUN a2enmod rewrite headers expires ssl

## Enable Chamilo Site
ADD chamilo.conf /etc/apache2/sites-available/chamilo.conf
RUN a2ensite chamilo

EXPOSE 80/tcp
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
