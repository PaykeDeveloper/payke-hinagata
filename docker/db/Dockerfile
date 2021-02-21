FROM mysql/mysql-server:8.0.23

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_REPLICA_USER
ARG MYSQL_REPLICA_PASSWORD

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d/

RUN sed -i 's/:database/'"${MYSQL_DATABASE}"'/g' /docker-entrypoint-initdb.d/init.sql
RUN sed -i 's/:user/'"${MYSQL_USER}"'/g' /docker-entrypoint-initdb.d/init.sql
RUN sed -i 's/:replica_user/'"${MYSQL_REPLICA_USER}"'/g' /docker-entrypoint-initdb.d/init.sql
RUN sed -i 's/:replica_password/'"${MYSQL_REPLICA_PASSWORD}"'/g' /docker-entrypoint-initdb.d/init.sql

COPY tmp/my.cnf /tmp/my.cnf
RUN cat /tmp/my.cnf >> /etc/my.cnf

ENV LOG_DIR /var/log/mysql/
RUN mkdir $LOG_DIR
RUN chown mysql:mysql $LOG_DIR
