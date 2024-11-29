FROM --platform=$BUILDPLATFORM php:8.3-apache

# Enable Apache modules
#RUN a2enmod rewrite

# Install Xdebug
ARG DEV_MODE=false
RUN if [ "$DEV_MODE" = "true" ]; then \
        pecl install xdebug && docker-php-ext-enable xdebug; \
    fi
# Install and enable mongo php extension
RUN pecl install mongodb && docker-php-ext-enable mongodb

# Install extensions
RUN docker-php-ext-install pdo pdo_mysql

# Add configuration files
COPY php.ini /usr/local/etc/php/
COPY xdebug.ini /usr/local/etc/php/conf.d/

# Set working directory
WORKDIR /var/www/html
