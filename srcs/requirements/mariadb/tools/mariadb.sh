#!/bin/bash

# Set the color variables for the terminal
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# Check if the database directory exists; if not, create the database and grant privileges
if [ ! -d "/var/lib/mysql/$MYSQL_WP_DBNAME" ]; then
	# Start the MariaDB service
	if ! service mariadb start; then
		echo -e "${BOLD_RED}Error: Failed to start MariaDB service.${NO_COLOR}" >&2
		exit 1
	fi

	# Create the database
	echo -e "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DBNAME;" | mysql

	# Create a user with full privileges on the database
	echo -e "GRANT ALL PRIVILEGES ON $MYSQL_WP_DBNAME.* TO '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql

	# Grant the root user privileges on all databases and change password
	echo -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY '$MYSQL_ROOT_PSWD';" | mysql

	# Shutdown the MySQL server
	mysqladmin shutdown -uroot -p"$MYSQL_ROOT_PSWD"

	# Print a success message to the terminal
	echo -e "${BOLD_GREEN}Successfully created database $MYSQL_WP_DBNAME and granted privileges for user $MYSQL_USERNAME.${NO_COLOR}"
else
	# Print info message to the terminal
	echo -e "${BOLD_GREEN}Database directory /var/lib/mysql/$MYSQL_WP_DBNAME already exists. Skipping database creation and privilege granting.${NO_COLOR}"
fi

# Exit with a success code
exit 0
