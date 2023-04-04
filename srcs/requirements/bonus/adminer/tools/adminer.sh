#! /bin/bash

# Set the color variables for the terminal
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# If index.html exists, update Apache configuration, start Apache, remove index.html, and download latest Adminer
if [ -e /var/www/html/index.html ]; then
	sed -i "s/#ServerName www.example.com/ServerName \"$DOMAIN_NAME\"/" /etc/apache2/sites-available/000-default.conf # update Apache server name
	echo "ServerName $DOMAIN_NAME" >>/etc/apache2/apache2.conf                                                        # update Apache server name
	service apache2 start                                                                                             # start Apache server
	service apache2 stop                                                                                              # stop Apache server
	rm -f /var/www/html/index.html                                                                                    # remove default index.html
	if ! curl -Lk -o /var/www/html/index.php https://www.adminer.org/latest.php; then                                 # download latest Adminer
		echo -e "${BOLD_RED}Error: Failed to download Adminer." >&2
		exit 1
	fi
fi

# Print a success message to the terminal
echo -e "\n${BOLD_GREEN}Successfully configured Adminer.${NO_COLOR}\n"

# Exit with a success code
exit 0
