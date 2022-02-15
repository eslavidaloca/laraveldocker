# Dockerfile
FROM php:8.1-cli

RUN apt-get update -y && apt-get install -y libmcrypt-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# RUN docker-php-ext-install pdo mbstring
RUN apt-get install php-mysql
RUN apt-get install php-psgql
RUN apt-get install php-sqlite
# RUN docker-php-ext-install pdo pdo_pgsql
# RUN docker-php-ext-install pdo pdo_sqlite

WORKDIR /app
COPY . /app

RUN composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000

# Host path                                             container path
# /mnt/                                                 /mnt
# /mnt/cache/appdata/#Here goes the user#               /config

# Command to build this dockerfile: docker build -t laraveldocker .
# Command to run this dockerfile: docker run -it -p 8000:8000 laraveldocker      it hasnt worked for me