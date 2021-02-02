FROM debian:buster
RUN	apt-get update && apt-get install -y wget nginx mariadb-server php-mysql php-fpm
WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && rm latest.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz && tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz && rm phpMyAdmin-4.9.7-all-languages.tar.gz
COPY /srcs/wp-config.php ./wordpress
WORKDIR /../../etc/nginx/
RUN rm ./sites-enabled/default
RUN rm ./sites-available/default
COPY /srcs/default_on ./sites-available/
RUN ln -s /etc/nginx/sites-available/default_on /etc/nginx/sites-enabled/default_on
RUN openssl req -newkey rsa:2048 -nodes -keyout domain.key -x509 -days 365 -out domain.crt -subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=school21/CN=mlorette"
WORKDIR /../../../../
COPY /srcs/autoindex.sh .
COPY /srcs/default_off .
COPY /srcs/default_on .
COPY /srcs/mysql.sh .
CMD bash mysql.sh
EXPOSE 80 443