# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/04 22:37:47 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Debian Bullseye image as the base image for the container
FROM debian:bullseye

# Copy the necessary files for configuring Nginx and generating SSL certificate to the container's /tmp directory
COPY ./tools/ ./conf/ /tmp/

# Update the package manager and install Nginx
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install curl nginx -y \
	# Copy the Nginx configuration file from the /tmp directory to the appropriate location in the container
	&& cp /tmp/default /etc/nginx/sites-available/default \
	# Copy the website files to the appropriate location in the container
	&& cp /tmp/index.html /tmp/style.css /tmp/pic.png /var/www/html/ \
	# Grant execute permission to the website.sh script
	&& chmod +x /tmp/website.sh

# Expose port 80
EXPOSE 80

# Set the entry point to Bash and the default command to start Nginx and the website.sh script
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/tmp/website.sh && /usr/sbin/nginx -g 'daemon off;'" ]
