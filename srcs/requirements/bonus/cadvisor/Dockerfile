# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/20 15:03:08 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install curl -y; \
	curl -Lk -o /cadvisor https://github.com/google/cadvisor/releases/download/v0.46.0/cadvisor-v0.46.0-linux-amd64; \
	chmod a+x /cadvisor;
ENTRYPOINT [ "./cadvisor" ]