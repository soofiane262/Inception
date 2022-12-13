FROM debian:bullseye
RUN apt-get update -y; \
	apt-get install -y curl php-fpm php-mysql; \
	curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp; \
	mkdir -p /var/www/html; \
	chown -R www-data:www-data /var/www/html; \
	cd /var/www/html; \
	runuser -u www-data -- wp core download;
ENTRYPOINT [ "tail" ]
CMD [ "-f" ]