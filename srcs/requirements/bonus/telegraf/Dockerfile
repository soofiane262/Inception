# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/08 15:05:38 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./tools/ ./conf/ /tmp/
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install -y wget curl gnupg2 lsb-release ca-certificates \
	apt-transport-https software-properties-common procps
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/telegraf.sh" ]