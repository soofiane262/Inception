# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 19:11:53 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	inception

CMPS_CMD		=	docker compose

CMPS_FILE		=	srcs/docker-compose.yml

VOLUMES_ROOT	=	/Users/souf/Desktop/Inception/inception-volumes

VOLUMES			=	$(VOLUMES_ROOT)/web $(VOLUMES_ROOT)/mariadb $(VOLUMES_ROOT)/influxdb

COMPOSE			=	$(CMPS_CMD) -f $(CMPS_FILE) -p $(NAME)

$(NAME): volumes
	@$(COMPOSE) up --build

volumes:
	@mkdir -p $(VOLUMES)

build:
	@$(COMPOSE) build

ps:
	@$(COMPOSE) ps

up:
	@$(COMPOSE) up

down:
	@$(COMPOSE) down

voldown:
	@$(COMPOSE) down --volumes

fclean: voldown
	@rm -rf $(VOLUMES_ROOT)

re: fclean all

.PHONY: all volumes build ps up down voldown fclean re
