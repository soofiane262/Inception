# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/20 15:50:40 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	Inception

COMPOSE	=	srcs/docker-compose.yml

# VOLUMES_ROOT	=	/home/sel-mars/data/inception-volumes
VOLUMES_ROOT	=	volumes

VOLUMES	=	$(VOLUMES_ROOT)/db $(VOLUMES_ROOT)/web

all: $(NAME)

$(NAME): $(CMPS)
	@mkdir -p $(VOLUMES)
	@docker-compose --verbose -f $(COMPOSE) up --build

build:
	@docker-compose --verbose -f $(COMPOSE) build

up:
	@docker-compose --verbose -f $(COMPOSE) up

ps:
	@docker-compose --verbose -f $(COMPOSE) ps

images:
	@docker-compose --verbose -f $(COMPOSE) images

start:
	@docker-compose --verbose -f $(COMPOSE) start

stop:
	@docker-compose --verbose -f $(COMPOSE) stop

down:
	@docker-compose --verbose -f $(COMPOSE) down --volumes

fclean: down
	@rm -rf $(VOLUMES_ROOT)

re: fclean all

.PHONY: all clean fclean
