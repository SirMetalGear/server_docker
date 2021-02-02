#!/bin/bash

service mysql start

service php7.3-fpm start

service nginx start

mysql -e "create database metal_db;"
mysql -e "create user admin;"
mysql -e "grant all on metal_db.* to 'admin'@'localhost' identified by 'password';"
mysql -e "flush privileges;"
bash