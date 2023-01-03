# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/03 17:47:10 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	Inception

CMPS_FILE		=	srcs/docker-compose.yml

CMPS_CMD		=	docker compose

VOLUMES_ROOT	=	/home/sel-mars/InceptionVolumes

VOLUMES			=	$(VOLUMES_ROOT)/web $(VOLUMES_ROOT)/db $(VOLUMES_ROOT)/grafana

all: $(NAME)

$(NAME):
	@mkdir -p $(VOLUMES)
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) up --build

build:
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) build

up:
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) up

ps:
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) ps

images:
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) images

start:
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) start

stop:
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) stop

down:
	@$(CMPS_CMD) --verbose -f $(CMPS_FILE) down --volumes

fclean: down
	@rm -rf $(VOLUMES_ROOT)

re: fclean all

.PHONY: all build up ps images start stop down fclean re
