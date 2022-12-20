# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/20 15:41:23 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	Inception

COMPOSE	=	srcs/docker-compose.yml

VOLUMES	=	/home/sel-mars/data/inception-volumes/db /home/sel-mars/data/inception-volumes/web

all: $(NAME)

$(NAME): $(CMPS)
	@sudo mkdir -p $(VOLUMES)
	@sudo docker compose --verbose -f $(COMPOSE) up --build

build:
	@sudo docker compose --verbose -f $(COMPOSE) build

up:
	@sudo docker compose --verbose -f $(COMPOSE) up

ps:
	@sudo docker compose --verbose -f $(COMPOSE) ps

images:
	@sudo docker compose --verbose -f $(COMPOSE) images

start:
	@sudo docker compose --verbose -f $(COMPOSE) start

stop:
	@sudo docker compose --verbose -f $(COMPOSE) stop

down:
	@sudo docker compose --verbose -f $(COMPOSE) down --volumes

fclean: down
	@sudo rm -rf volumes

re: fclean all

.PHONY: all clean fclean
