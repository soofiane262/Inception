# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 23:11:38 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 18:42:05 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -d /var/lib/mysql/$MYSQL_WP_DBNAME ] ; then
	echo -e "\n\e[3m\e[1;37m# ---------------------------- Configuring MariaDB --------------------------- #\e[0m\n"
	service mariadb start
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DBNAME;" | mysql
	echo "GRANT ALL PRIVILEGES ON $MYSQL_WP_DBNAME.* TO '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY '$MYSQL_ROOT_PSWD';" | mysql
	mysqladmin shutdown -uroot -p$MYSQL_ROOT_PSWD
fi
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                               Starting Mariadb                               \e[0m
\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n"
mysqld_safe