# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/16 20:34:19 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	Inception

COMPOSE	=	srcs/docker-compose.yml

VOLUMES	=	volumes/mariadb volumes/wp_nginx

all: $(NAME)

$(NAME): $(CMPS)
	@mkdir -p $(VOLUMES)
	@docker-compose --verbose -f $(COMPOSE) up --build

build:
	@docker-compose --verbose -f $(COMPOSE) build

up:
	@docker-compose --verbose -f $(COMPOSE) up

clean:
	@docker-compose --verbose -f $(COMPOSE) stop

fclean:
	@docker-compose --verbose -f $(COMPOSE) down
	@rm -rf volumes

re: fclean all

.PHONY: all clean fclean
