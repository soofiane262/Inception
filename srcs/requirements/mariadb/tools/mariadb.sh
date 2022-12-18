# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 23:11:38 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/19 00:03:08 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
apt-get update -y;
apt-get upgrade -y;
apt-get install mariadb-server -y;
service mariadb start;
sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql;
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PSWD';" | mysql;
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY '$MARIADB_ROOT_PSWD';" | mysql;
mysqladmin shutdown -uroot -p$MARIADB_ROOT_PSWD;
mysqld_safe;