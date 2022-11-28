FROM debian:bullseye
RUN apt update -y; apt install mariadb-server -y; \
	service mariadb start; mariadb; grant all on *.* to \
	'root'@'localhost' identified by 'root123' with grant \
	option;
ENTRYPOINT [ "tail" , "-f" ]