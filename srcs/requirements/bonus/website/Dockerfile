# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/02 13:16:43 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./tools ./conf /tmp/
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install nginx -y; \
	cp /tmp/default /etc/nginx/sites-available/default; \
	cp /tmp/index.html /tmp/style.css /tmp/pic.png /var/www/html/;
ENTRYPOINT [ "nginx" ]
CMD [ "-g" , "daemon off;" ]