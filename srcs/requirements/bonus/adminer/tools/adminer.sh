# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    adminer.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/03 15:59:39 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/03 16:01:08 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
sed -i "s/#ServerName www.example.com/ServerName $DOMAIN_NAME/" /etc/apache2/sites-available/000-default.conf;
sed -i "s/80/8081/" /etc/apache2/sites-available/000-default.conf;
sed -i "s/80/8081/" /etc/apache2/ports.conf;
echo "ServerName $DOMAIN_NAME" >> /etc/apache2/apache2.conf;
service apache2 start;
service apache2 stop;
rm -rf /var/www/html/index.html;
curl -Lk -o /var/www/html/index.php https://www.adminer.org/latest.php;
apachectl -D FOREGROUND;