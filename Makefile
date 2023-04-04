# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:48:40 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/04 22:36:28 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Set the name of the project
NAME			:= inception

# Define the Docker Compose command to use (`docker-compose` for v1 and `docker compose` for v2)
CMPS_CMD		:= docker-compose

# Specify the path to the Docker Compose file
CMPS_FILE		:= srcs/docker-compose.yml

# Define the root directory for the project volumes
VOLUMES_ROOT	:= /Users/sel-mars/data

# Specify the volumes to be used by the project
VOLUMES			:= $(addprefix $(VOLUMES_ROOT)/,web mariadb influxdb)

# Define the complete Docker Compose command with the specified project name and file
COMPOSE			:= $(CMPS_CMD) -f $(CMPS_FILE) -p $(NAME)

# Target to bring up the project, creating volumes if necessary
$(NAME): volumes
	@$(COMPOSE) up --build

# Target to create the project volumes
volumes:
	@mkdir -p $(VOLUMES)

# Target to build the project services
build:
	@$(COMPOSE) build

# Target to show the status of the project services
ps:
	@$(COMPOSE) ps

# Target to start the project services
up:
	@$(COMPOSE) up

# Target to stop the project services
down:
	@$(COMPOSE) down

# Target to stop the project services and remove volumes
voldown:
	@$(COMPOSE) down --volumes

# Target to remove the project volumes and clean up the project directory
fclean: voldown
	@rm -rf $(VOLUMES)

# Target to perform a full rebuild of the project
re: fclean $(NAME)

# Declare these targets as phony, meaning they don't correspond to actual files
.PHONY: all volumes build ps up down voldown fclean re
