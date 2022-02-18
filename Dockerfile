# Dockerfile
FROM php:8.1-cli

# RUN apt-get update -y && apt-get install -y libmcrypt-dev

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN mv /var/www/html /var/www/public
# RUN docker-php-ext-install pdo mbstring
# RUN apt-get install php-mysql
# RUN apt-get install php-psgql
# RUN apt-get install php-sqlite
# RUN docker-php-ext-install pdo pdo_pgsql
# RUN docker-php-ext-install pdo pdo_sqlite

WORKDIR /app
COPY . /app

# RUN composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000

# Host path                                             container path
# /mnt/                                                 /mnt
# /mnt/cache/appdata/#Here goes the user#               /config

# Command to build this dockerfile: docker build -t laraveldocker .
# Command to run this dockerfile: docker run -it -p 8000:8000 laraveldocker      it hasnt worked for me

# Dockerfile I stole

# #
# # Use this dockerfile to run the application.
# #
# # Start the server using docker-compose:
# #
# #   docker-compose build
# #   docker-compose up
# #
# # NOTE: In future examples replace {{volume_name}} with your projects desired volume name
# #
# # You can install dependencies via the container:
# #
# #   docker-compose run {{volume_name}} composer install
# #
# # You can manipulate dev mode from the container:
# #
# #   docker-compose run {{volume_name}} composer development-enable
# #   docker-compose run {{volume_name}} composer development-disable
# #   docker-compose run {{volume_name}} composer development-status
# #
# # OR use plain old docker 
# #
# #   docker build -f Dockerfile-dev -t {{volume_name}} .
# #   docker run -it -p "8080:80" -v $PWD:/var/www {{volume_name}}
# #
# FROM php:7.2-apache

# RUN apt-get update \
#  && apt-get install -y vim git zlib1g-dev mariadb-client libzip-dev \
#  && docker-php-ext-install zip mysqli pdo_mysql \
#  && pecl install xdebug \
#  && docker-php-ext-enable xdebug \
#  && echo 'xdebug.remote_enable=on' >> /usr/local/etc/php/conf.d/xdebug.ini \
#  && echo 'xdebug.remote_host=host.docker.internal' >> /usr/local/etc/php/conf.d/xdebug.ini \
#  && echo 'xdebug.remote_port=9000' >>  /usr/local/etc/php/conf.d/xdebug.ini \
#  && a2enmod rewrite \
#  && sed -i 's!/var/www/html!/var/www/public!g' /etc/apache2/sites-available/000-default.conf \
#  && mv /var/www/html /var/www/public \
#  && curl -sS https://getcomposer.org/installer \
#   | php -- --install-dir=/usr/local/bin --filename=composer \
#  && echo "AllowEncodedSlashes On" >> /etc/apache2/apache2.conf

# WORKDIR /var/www

# https://stacktuts.com/illuminate-database-queryexception-sqlstate-hy000-2002-connection-refused-sql-select-from-information-schema-tables-where-table-schema-laravel-and-table-name-migrations-and-table-type-base-table