# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 23:11:38 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 13:25:47 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if ( grep "127.0.0.1" /etc/mysql/mariadb.conf.d/50-server.cnf ); then
	echo -e "\n\e[3m\e[1;37m# ---------------------------- Configuring MariaDB --------------------------- #\e[0m\n"
	sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
	service mariadb start
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;" | mysql
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PSWD';" | mysql
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY '$MYSQL_ROOT_PSWD';" | mysql
	mysqladmin shutdown -uroot -p$MYSQL_ROOT_PSWD
fi
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                               Starting Mariadb                               \e[0m
\e[3m\e[1;37m\n# ---------------------------------------------------------------------------- #\e[0m\n"
mysqld_safe