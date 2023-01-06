# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    adminer.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/03 15:59:39 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/06 22:17:27 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ -e /var/www/html/index.html ]; then
	sed -i "s/#ServerName www.example.com/ServerName $DOMAIN_NAME/" /etc/apache2/sites-available/000-default.conf
	echo "ServerName $DOMAIN_NAME" >> /etc/apache2/apache2.conf
	service apache2 start
	service apache2 stop
	rm -f /var/www/html/index.html
	curl -Lk -o /var/www/html/index.php https://www.adminer.org/latest.php
fi
apachectl -D FOREGROUND