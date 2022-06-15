FROM nginx:1.21

RUN apt-get update -qq

COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html/public
