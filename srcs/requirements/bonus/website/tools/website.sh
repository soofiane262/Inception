# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    website.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/19 16:40:03 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/19 17:15:40 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
apt-get update -y;
apt-get upgrade -y;
apt-get install nginx openssl -y;
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout /etc/ssl/nginx-ss-cert.key -out /etc/ssl/nginx-ss-cert.crt -subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=42 Network/OU=1337/CN=$SERVER_NAME";
cp /tmp/default /etc/nginx/sites-available/default;
cp /tmp/website.html /var/www/html/;
nginx -g 'daemon off;';