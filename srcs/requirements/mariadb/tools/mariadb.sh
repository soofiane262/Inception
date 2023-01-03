# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 23:11:38 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/03 22:47:02 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
service mariadb start
sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;" | mysql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PSWD';" | mysql
echo "GRANT SELECT ON performance_schema.* TO '$GF_MYSQL_USER'@'%' IDENTIFIED BY '$GF_MYSQL_PSWD';" | mysql
echo "GRANT SELECT ON mysql.* TO '$GF_MYSQL_USER'@'%' IDENTIFIED BY '$GF_MYSQL_PSWD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY '$MYSQL_ROOT_PSWD';" | mysql
mysqladmin shutdown -uroot -p$MYSQL_ROOT_PSWD
mysqld_safe