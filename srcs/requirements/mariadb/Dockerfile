FROM debian:bullseye
COPY ./conf/mariadb_conf.sql /tmp
RUN apt update -y; \
	apt install mariadb-server -y; \
	service mariadb start; \
	mysql < /tmp/mariadb_conf.sql
ENTRYPOINT [ "mysqld_safe" ]