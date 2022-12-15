# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/15 19:29:31 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	Inception

COMPOSE	=	srcs/docker-compose.yml

VOLUMES	=	volumes/mariadb volumes/wp_nginx

all: $(NAME)

$(NAME): $(CMPS)
	@mkdir -p $(VOLUMES)

.PHONY: all
