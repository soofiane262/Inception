FROM debian:bullseye
COPY ./conf/default /etc/nginx/sites-available/default
RUN apt update -y; \
	apt install nginx openssl -y;\
	openssl req -x509 -newkey rsa:4096 -days 365 -nodes \
	-keyout /etc/ssl/nginx-ss-cert.key \
	-out /etc/ssl/nginx-ss-cert.crt \
	-subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=42 Network/OU=1337/CN=localhost"
ENTRYPOINT [ "nginx" ]
CMD [ "-g" , "daemon off;" ]