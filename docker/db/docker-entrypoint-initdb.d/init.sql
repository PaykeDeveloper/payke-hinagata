CREATE DATABASE testing;
GRANT ALL ON testing.* to ':user'@'%';

CREATE USER ':replica_user' IDENTIFIED BY ':replica_password';
GRANT SELECT ON testing.* TO ':replica_user'@'%';
GRANT SELECT ON :database.* TO ':replica_user'@'%';
