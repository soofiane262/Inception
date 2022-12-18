# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 21:59:06 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/18 22:15:30 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
apt-get update -y;
apt-get upgrade -y;
apt-get install nginx openssl -y;
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout /etc/ssl/nginx-ss-cert.key -out /etc/ssl/nginx-ss-cert.crt -subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=42 Network/OU=1337/CN=$SERVER_NAME";
cp /tmp/default /etc/nginx/sites-available/default;
nginx -g 'daemon off;';