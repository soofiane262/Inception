#!/bin/bash

# Set the color variables for the terminal
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# If wp-config.php does not exist, perform WordPress installation
if [ ! -e /var/www/html/wp-config.php ]; then
	# Create a new group and add www-data user to it
	groupadd www-pub
	usermod -aG www-pub www-data

	# Download WordPress core files, configure database settings, and perform WordPress installation
	if ! runuser -u www-data -- wp core download --path="/var/www/html"; then
		echo -e "${BOLD_RED}Error: Failed to download WordPress core files.${NO_COLOR}" >&2
		exit 1
	fi
	runuser -u www-data -- wp core config --dbname="$MYSQL_WP_DBNAME" --dbuser="$MYSQL_USERNAME" --dbpass="$MYSQL_PASSWORD" --dbhost='mariadb' --dbprefix='wp_' --skip-check --path="/var/www/html"
	runuser -u www-data -- wp core install --url="https://$DOMAIN_NAME" --title='Inception' --admin_user="$WP_ADMIN_USERNAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path="/var/www/html"

	# Install and activate Redis Cache plugin, configure Redis settings, and enable Redis cache
	runuser -u www-data -- wp plugin install redis-cache --activate --path="/var/www/html"
	runuser -u www-data -- wp config set WP_REDIS_PORT 6379 --path="/var/www/html"
	runuser -u www-data -- wp config set WP_REDIS_HOST redis --path="/var/www/html"
	runuser -u www-data -- wp redis enable --path="/var/www/html"

	# Create a new author user
	runuser -u www-data -- wp user create "$WP_AUTHOR_USERNAME" "$WP_AUTHOR_EMAIL" --role=author --user_pass="$WP_AUTHOR_PASSWORD" --path="/var/www/html"

	# Set ownership and permissions on the web server root directory
	chown -R www-data:www-pub /var/www
	chmod 2775 /var/www
fi

# Change the PHP-FPM configuration to listen on port 9000
sed -i -e "s/listen =.*/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf

# If the /run/php directory does not exist, start and stop the php7.4-fpm service to create it
if [ ! -d /run/php ]; then
	service php7.4-fpm start
	service php7.4-fpm stop
fi

# Print a success message to the terminal
echo -e "${BOLD_GREEN}Successfully installed WordPress.${NO_COLOR}"

# Exit with a success code
exit 0
