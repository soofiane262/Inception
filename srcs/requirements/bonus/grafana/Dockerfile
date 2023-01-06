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
COPY ./tools/ ./conf/ /tmp/
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install -y gnupg2 software-properties-common curl; \
	curl -Lk https://packages.grafana.com/gpg.key | apt-key add -; \
	add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"; \
	apt-get update -y; \
	apt-get -y install grafana;
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/grafana.sh" ]