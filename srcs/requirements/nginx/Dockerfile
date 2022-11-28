FROM debian:bullseye
RUN apt update -y; apt install nginx openssl -y;\
	openssl req -x509 -newkey rsa:4096 -days 365 -nodes \
	-keyout /etc/ssl/nginx-ss-cert.key \
	-out /etc/ssl/nginx-ss-cert.crt \
	-subj "/C=MA/ST=./L=./O=./OU=./CN=localhost"
COPY ./tools/default /etc/nginx/sites-available/default
ENTRYPOINT [ "nginx" , "-g" , "daemon off;" ]