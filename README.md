#### SERVER WITH DOCKER ####

Цель проекта: научиться использовать Docker для развертывания сервера.

Описание: сервер поднимается на локальном хосте. Программа для запуска сервера - Nginx. Создается MySQL база данных.
Развертывается Wordpress с подсоединенной базой от MySQL. Для администрирования и контроля БД установлен PhpMyAdmin.
Доступ ко всем ресурам выполянется добавлением к uri адреса /wordpress и  /phpmyadmin соответственно.

Системные требования: Unix подобная система или MacOS. Установленный Docker.

Запуск: 

	1. Необходимо собрать Докер - образ. В папке с проектом прописываем: docker build -t local_server . 
	
	2. docker run -it -p 80:80 -p 443:443 local_server команда для запуска контейнера Docker и дальнейшей работы
	в этом контейнера посредством удаленного доступа в терминал, с разрешением открытия порта 80 и 443 (для SSL соединения).
	
	3. docker run -t -d -p 80:80 -p 443:443 local_server запуск сервера в режиме демона.
	
	4. Для администрирования логин: admin пароль: password
