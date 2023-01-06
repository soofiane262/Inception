# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/06 21:17:48 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install redis-server -y; \
	sed -i "s/127.0.0.1/0.0.0.0/" /etc/redis/redis.conf;
ENTRYPOINT [ "redis-server" ]
CMD [ "--protected-mode" , "no" ]