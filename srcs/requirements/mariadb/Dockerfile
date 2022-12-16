# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:35:02 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/16 21:01:53 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./conf/mariadb_conf.sql /tmp
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install mariadb-server -y; \
	service mariadb start; \
	sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf; \
	mysql < /tmp/mariadb_conf.sql;
ENTRYPOINT [ "mysqld_safe" ]