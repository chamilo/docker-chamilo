FROM php:7.4-apache

LABEL maintainer="Chamilo <info@chamilo.org>"

# Install required system packages
RUN apt-get update && apt-get install -y \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the Chamilo version
ENV CHAMILO_VERSION 1.11.18

# Download Chamilo
RUN curl -SL "https://github.com/chamilo/chamilo-lms/releases/download/v${CHAMILO_VERSION}/chamilo-${CHAMILO_VERSION}.tar.gz" -o chamilo.tar.gz \
    && tar -xzf chamilo.tar.gz -C /var/www/html --strip-components=1 \
    && rm chamilo.tar.gz \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R go=u,go-w /var/www/html

# Expose port 80 for Apache
EXPOSE 80

