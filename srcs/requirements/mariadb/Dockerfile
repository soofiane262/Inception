# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:35:02 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/05 12:24:37 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Debian Bullseye image as the base image for the container
FROM debian:bullseye

# Copy some tools to the container's /tmp directory
COPY ./tools/ /tmp/

# Update package list, upgrade existing packages, and install MariaDB server
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y mariadb-server \
	# Modify MariaDB configuration file to listen on all network interfaces
	&& sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf \
	# Grant execute permission to the mariadb.sh script
	&& chmod +x /tmp/mariadb.sh

# Expose the port used by MariaDB
EXPOSE 3306

# Set the entrypoint and default command for the container
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/tmp/mariadb.sh; mysqld_safe" ]
