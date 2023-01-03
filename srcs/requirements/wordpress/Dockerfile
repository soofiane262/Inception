# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:32 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/03 19:31:40 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install -y curl php-fpm php-mysql; \
	sed -i -e "s/listen =.*/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf; \
	curl -LkO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp;
COPY ./tools /tmp
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/wp.sh" ]