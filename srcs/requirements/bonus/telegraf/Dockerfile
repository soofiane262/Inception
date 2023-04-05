# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/05 13:13:20 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Debian Bullseye image as the base image for the container
FROM debian:bullseye

# Copy necessary files to the container
COPY ./tools/ ./conf/ /tmp/

# Update and install required packages
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y wget curl gnupg2 lsb-release ca-certificates \
	apt-transport-https software-properties-common procps \
	# Grant execute permission to the telegraf.sh script
	&& chmod +x /tmp/telegraf.sh

# Set the default entrypoint to bash to run the Telegraf script and start Telegraf
ENTRYPOINT [ "/bin/bash" , "-c" ]
CMD [ "/tmp/telegraf.sh; telegraf" ]
