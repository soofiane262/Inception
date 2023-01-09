# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 19:29:06 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./tools/ ./conf/ /tmp/
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install nginx -y; \
	cp /tmp/default /etc/nginx/sites-available/default; \
	cp /tmp/index.html /tmp/style.css /tmp/pic.png /var/www/html/;
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/website.sh" ]