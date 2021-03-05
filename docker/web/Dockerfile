FROM nginx:1.19.7

RUN apt-get update -qq

COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html/public
