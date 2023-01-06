# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:33:51 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/06 23:59:06 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e /var/www/html/index.php ]; then
	cd /var/www/html
	wp core download --allow-root
	wp core config --dbname="$MYSQL_DB_NAME" --dbuser="$MYSQL_USER_NAME" --dbpass="$MYSQL_USER_PSWD" --dbhost='mariadb' --dbprefix='wp_' --skip-check --allow-root
	wp core install --url="https://$DOMAIN_NAME" --title='Inception' --admin_user="$WP_ADMIN_USER_NAME" --admin_password="$WP_ADMIN_USER_PSWD" --admin_email="$WP_ADMIN_USER_MAIL" --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
	wp redis enable --allow-root
	wp user create $WP_AUTH_USER_NAME $WP_AUTH_USER_MAIL --role=author --user_pass=$WP_AUTH_USER_PSWD --allow-root
	service php7.4-fpm start
	service php7.4-fpm stop
fi
php-fpm7.4 -F