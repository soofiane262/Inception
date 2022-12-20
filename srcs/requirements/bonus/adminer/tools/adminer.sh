# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    adminer.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 21:16:45 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/20 15:04:24 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
sed -i "s/#ServerName www.example.com/ServerName $SERVER_NAME/" /etc/apache2/sites-available/000-default.conf;
sed -i "s/80/$ADMINER_PORT/" /etc/apache2/sites-available/000-default.conf;
sed -i "s/80/$ADMINER_PORT/" /etc/apache2/ports.conf;
echo "ServerName $SERVER_NAME" >> /etc/apache2/apache2.conf;
service apache2 start;
service apache2 stop;
rm -rf /var/www/html/index.html;
curl -Lk -o /var/www/html/index.php https://www.adminer.org/latest.php;
apachectl -D FOREGROUND;