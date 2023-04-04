# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:32 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/04 21:30:35 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the Debian Bullseye base image
FROM debian:bullseye

# Update package list, upgrade installed packages, and install required packages
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y curl php-fpm php-mysql \
	# Download and install WP-CLI
	&& curl -LkO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	# Create directory for web server root
	&& mkdir -p /var/www/html \
	# Grant execute permission to the wp.sh script
	&& chmod +x /tmp/wp.sh

# Copy the tools directory to the container's /tmp directory
COPY ./tools/ /tmp/

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the entrypoint for the container to bash, and set the command to run wp.sh followed by php-fpm
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/tmp/wp.sh && php-fpm7.4 -F" ]
