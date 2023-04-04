# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/04 21:45:12 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Debian Bullseye image as the base image for the container
FROM debian:bullseye

# Update the package repository and upgrade installed packages
RUN apt-get update -y \
	&& apt-get upgrade -y \
	# Install Redis Server
	&& apt-get install redis-server -y \
	# Configure Redis Server to listen to all incoming network interfaces
	&& sed -i "s/127.0.0.1/0.0.0.0/" /etc/redis/redis.conf

# Copy the necessary scripts for running Redis inside the container
COPY ./tools/ /tmp/

# Expose port 6379 for Redis clients
EXPOSE 6379

# Set the default entrypoint to bash and the default command to start Redis
ENTRYPOINT [ "/bin/bash" , "-c" ]
CMD [ "redis-server --protected-mode no" ]
