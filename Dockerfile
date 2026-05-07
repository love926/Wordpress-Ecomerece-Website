FROM wordpress:php8.1-apache

WORKDIR /var/www/html

COPY . /var/www/html/

EXPOSE 80
