# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:33:51 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/16 15:44:06 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
apt-get update -y;
apt-get install -y curl php-fpm php-mysql;
curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
mkdir -p /var/www/html;
chown -R www-data:www-data /var/www/html;
cd /var/www/html;
runuser -u www-data -- wp core download;
runuser -u www-data -- wp core config --dbname='wp' --dbuser='souf' --dbpass='souf123' --dbhost='mariadb' --dbprefix='wp_' --skip-check;
runuser -u www-data -- wp core install --url='https://localhost' --title='Inception' --admin_user='sel-mars42' --admin_password='sel-mars42' --admin_email='sel-mars@1337.ma';
runuser -u www-data -- wp plugin install redis-cache --activate;
runuser -u www-data -- wp config set WP_REDIS_PORT 6379;
runuser -u www-data -- wp config set WP_REDIS_HOST redis;
runuser -u www-data -- wp redis enable;
runuser -u www-data -- wp user create auth42 auth42@example.com --role=author --user_pass=auth42;
sed -i -e "s/listen =.*/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf;
service php7.4-fpm start;
service php7.4-fpm stop;
php-fpm7.4 -F;