FROM debian:bullseye
COPY ./conf/mariadb_conf.sql /tmp
RUN apt-get update -y; \
	apt-get install mariadb-server -y; \
	service mariadb start; \
	sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf; \
	mysql < /tmp/mariadb_conf.sql;
ENTRYPOINT [ "mysqld_safe" ]