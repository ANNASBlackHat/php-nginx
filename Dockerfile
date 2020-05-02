FROM php:7.3-fpm-alpine

#install nginx
RUN apk update \
    && apk add nginx \
    && apk add openrc
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

#set configuration fox nginx
COPY app.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

COPY . /www

EXPOSE 80
CMD nginx && php-fpm
