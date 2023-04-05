# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2023/04/05 12:53:29 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use Debian Bullseye as the base image
FROM debian:bullseye

# Copy the tools directory to the container's /tmp directory
COPY ./tools/ /tmp/

# Update the package list, upgrade the packages, and install vsftpd
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y vsftpd \
	# Grant execute permission to the ftp.sh script
	&& chmod +x /tmp/ftp.sh

# Expose the default FTP ports and a range of passive ports for data connections
EXPOSE 20-21 40000-40005

# Set the entrypoint to /bin/bash -c
ENTRYPOINT [ "/bin/bash", "-c" ]

# Start the FTP server with the ftp.sh script and the vsftpd command
CMD [ "/tmp/ftp.sh; vsftpd" ]
