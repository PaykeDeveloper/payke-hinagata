FROM nginx:1.19.7

RUN apt-get update -qq

COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf


ENV BASE_DIR /var/www/html/public
WORKDIR $BASE_DIR
RUN mkdir $BASE_DIR/storage
RUN mkdir $BASE_DIR/vendor
