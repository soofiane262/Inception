# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/16 17:02:41 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
COPY ./tools/script.sh /tmp/script.sh
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/script.sh" ]