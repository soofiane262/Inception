# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/07 17:34:53 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./tools/ /tmp/
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install -y gnupg2 curl lsb-release;
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/influxdb.sh" ]