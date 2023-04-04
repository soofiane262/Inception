# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/04 22:38:00 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Debian Bullseye image as the base image for the container
FROM debian:bullseye

# Copy the necessary files for configuring Nginx and generating SSL certificate to the container's /tmp directory
COPY ./tools/ ./conf/ /tmp/

# Update the package manager and install Nginx and OpenSSL
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y curl nginx openssl \
	# Copy the Nginx configuration file from the /tmp directory to the appropriate location in the container
	&& cp /tmp/default /etc/nginx/sites-available/default \
	# Generate a self-signed SSL certificate for Nginx using OpenSSL
	&& openssl req -x509 -newkey rsa:4096 -days 365 -nodes \
	-keyout /etc/ssl/nginx-ss-cert.key \
	-out /etc/ssl/nginx-ss-cert.crt \
	-subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=42 Network/OU=1337/CN=sel-mars.42.fr" \
	# Grant execute permission to the nginx.sh script
	&& chmod +x /tmp/nginx.sh

# Expose port 443
EXPOSE 443

# Set the entry point to Bash and the default command to start Nginx and the nginx.sh script
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/tmp/nginx.sh && /usr/sbin/nginx -g 'daemon off;'" ]
