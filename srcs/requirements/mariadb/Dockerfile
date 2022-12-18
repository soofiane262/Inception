# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:35:02 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/19 00:00:03 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./tools/mariadb.sh /tmp/
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/mariadb.sh" ]