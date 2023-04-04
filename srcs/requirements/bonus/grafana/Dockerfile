# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/04 22:11:00 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Debian Bullseye image as the base image for the container
FROM debian:bullseye

# Copy necessary files to the container's /tmp directory
COPY ./tools/ ./conf/ /tmp/

# Update the package manager, upgrade installed packages, and install required packages
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y gnupg2 software-properties-common curl \
	# Add Grafana's GPG key and repository to the package manager's list of sources
	&& curl -Lk https://packages.grafana.com/gpg.key | apt-key add - \
	&& add-apt-repository "deb https://packages.grafana.com/oss/deb stable main" \
	# Update the package manager again to get the Grafana package, and install it
	&& apt-get update -y \
	&& apt-get -y install grafana

# Expose the port 3000
EXPOSE 3000

# Set the entrypoint to Bash and command for the container to start Grafana and the grafana.sh script
ENTRYPOINT [ "/bin/bash" , "-c" ]
CMD [ "/tmp/grafana.sh && grafana-server -config $GF_PATHS_CONFIG -homepath $GF_PATHS_HOME" ]
