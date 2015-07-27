FROM ubuntu:14.04
MAINTAINER Yannick Warnier <ywarnier@chamilo.org>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Update Ubuntu and install basic PHP stuff
RUN apt-get -y update && apt-get install -y libapache2-mod-php5 php5-mysql php5-intl php5-gd php5-cli wget curl php5-curl

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

RUN mkdir -p /var/www/chamilo
ADD https://github.com/chamilo/chamilo-lms/archive/v1.10.0-alpha.tar.gz /var/www/chamilo/chamilo.tar.gz
RUN cd /var/www/chamilo;tar zxf chamilo.tar.gz;mv chamilo-lms-1.10.0-alpha www
RUN cd /var/www/chamilo/www;chown -R www-data:www-data app main/default_course_document/images main/lang vendor web

EXPOSE 22 80
CMD ["/bin/bash"]
