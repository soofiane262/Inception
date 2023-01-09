# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:33:51 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 18:46:56 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e /var/www/html/wp-config.php ]; then
	echo -e "\n\e[3m\e[1;37m# ------------------------- Configuring Wordpress 1/2 ------------------------ #\e[0m\n"
	cd /var/www/html
	wp core download --allow-root
	chown -R www-data:www-data /var/www/html
	wp core config --dbname="$MYSQL_WP_DBNAME" --dbuser="$MYSQL_USERNAME" --dbpass="$MYSQL_PASSWORD" --dbhost='mariadb' --dbprefix='wp_' --skip-check --allow-root
	wp core install --url="https://$DOMAIN_NAME" --title='Inception' --admin_user="$WP_ADMIN_USERNAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
	wp redis enable --allow-root
	wp user create $WP_AUTHOR_USERNAME $WP_AUTHOR_EMAIL --role=author --user_pass=$WP_AUTHOR_PASSWORD --allow-root
fi
echo -e "\n\e[3m\e[1;37m# ------------------------- Configuring Wordpress 2/2 ------------------------ #\e[0m\n"
sed -i -e "s/listen =.*/listen = 9000/" /etc/php/$(wp --info | grep php.ini | cut -d'/' -f4 )/fpm/pool.d/www.conf
service php$(wp --info | grep php.ini | cut -d'/' -f4 )-fpm start
service php$(wp --info | grep php.ini | cut -d'/' -f4 )-fpm stop
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                              Starting WordPress                              \e[0m
\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n"
php-fpm$(wp --info | grep php.ini | cut -d'/' -f4 ) -F