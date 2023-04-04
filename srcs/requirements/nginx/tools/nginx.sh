#!/bin/bash

# Set the color variables for the terminal
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# Replace the `server_name` directive in the NGINX configuration file
# with the value of the $DOMAIN_NAME environment variable.
sed -i "s/server_name domain-name/server_name \"$DOMAIN_NAME\"/" /etc/nginx/sites-available/default

# Print a success message to the terminal
echo -e "${BOLD_GREEN}Successfully replaced the server_name directive in the NGINX configuration file.${NO_COLOR}"

# Exit with a success code
exit 0
