# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 13:43:08 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	Inception

CMPS_FILE		=	srcs/docker-compose.yml

CMPS_CMD		=	docker compose

VOLUMES_ROOT	=	/home/sel-mars/data/inception-volumes

VOLUMES			=	$(VOLUMES_ROOT)/web $(VOLUMES_ROOT)/mariadb $(VOLUMES_ROOT)/influxdb

all: $(NAME)

$(NAME):
	@mkdir -p $(VOLUMES)
	@$(CMPS_CMD) -f $(CMPS_FILE) up --build

build:
	@$(CMPS_CMD) -f $(CMPS_FILE) build

ps:
	@$(CMPS_CMD) -f $(CMPS_FILE) ps

up:
	@$(CMPS_CMD) -f $(CMPS_FILE) up

down:
	@$(CMPS_CMD) -f $(CMPS_FILE) down --volumes

fclean: down
	@rm -rf $(VOLUMES_ROOT)

re: fclean all

.PHONY: all build ps up down fclean re
