# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/04 21:31:00 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the Debian Bullseye base image
FROM debian:bullseye

# Update and upgrade package lists and install necessary packages
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y curl apache2 php libapache2-mod-php php-curl php-cli php-mysql php-gd \
	# Grant execute permission to the adminer.sh script
	&& chmod +x /tmp/adminer.sh


# Copy the tools directory into the image
COPY ./tools/ /tmp/

# Expose port 80 to allow external access to the Apache server
EXPOSE 80

# Set the entrypoint to run a shell command and default command to run adminer.sh and start the Apache server
ENTRYPOINT [ "/bin/bash" , "-c" ]
CMD [ "/tmp/adminer.sh && apachectl -D FOREGROUND" ]
