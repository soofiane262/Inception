# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/20 15:27:51 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./conf /tmp/
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install nginx openssl -y; \
	cp /tmp/default /etc/nginx/sites-available/default; \
	openssl req -x509 -newkey rsa:4096 -days 365 -nodes \
	-keyout /etc/ssl/nginx-ss-cert.key \
	-out /etc/ssl/nginx-ss-cert.crt \
	-subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=42 Network/OU=1337/CN=sel-mars.42.fr";
ENTRYPOINT [ "nginx" ]
CMD [ "-g" , "daemon off;" ]