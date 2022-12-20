# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:33:51 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/19 17:30:31 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
apt-get update -y;
apt-get upgrade -y; \
apt-get install -y curl php-fpm php-mysql;
curl -LkO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
mkdir -p /var/www/html;
chown -R www-data:www-data /var/www/html;
cd /var/www/html;
runuser -u www-data -- wp core download;
runuser -u www-data -- wp core config --dbname="$MYSQL_DB_NAME" --dbuser="$MYSQL_USER_NAME" --dbpass="$MYSQL_USER_PSWD" --dbhost='mariadb' --dbprefix='wp_' --skip-check;
runuser -u www-data -- wp core install --url="https://$SERVER_NAME" --title='Inception' --admin_user="$WP_ADMIN_USER_NAME" --admin_password="$WP_ADMIN_USER_PSWD" --admin_email="$WP_ADMIN_USER_MAIL";
runuser -u www-data -- wp plugin install redis-cache --activate;
runuser -u www-data -- wp config set WP_REDIS_PORT 6379;
runuser -u www-data -- wp config set WP_REDIS_HOST redis;
runuser -u www-data -- wp redis enable;
runuser -u www-data -- wp user create $WP_AUTH_USER_NAME $WP_AUTH_USER_MAIL --role=author --user_pass=$WP_AUTH_USER_PSWD;
sed -i -e "s/listen =.*/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf;
service php7.4-fpm start;
service php7.4-fpm stop;
php-fpm7.4 -F;