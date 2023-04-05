# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/05 12:24:22 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Debian Bullseye image as the base image for the container
FROM debian:bullseye

# Copy the tools directory from the build context to the container
COPY ./tools/ /tmp/

# Update package lists and install required packages
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y gnupg2 curl lsb-release \
	# Grant execute permission to the influxdb.sh script
	&& chmod +x /tmp/influxdb.sh

# Expose the port 8086
EXPOSE 8086

# Set the entrypoint to bash with the command to run influxdb.sh and influxd
ENTRYPOINT [ "bash" , "-c" ]
CMD [ "/tmp/influxdb.sh; influxd" ]
