# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 18:34:20 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/20 15:02:07 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye
RUN apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install vsftpd -y; \
	sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf; \
	sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf; \
	sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf; \
	sed -i "0,/#chroot_local_user=YES/ s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf; \
	echo "# Additional Configs" >> /etc/vsftpd.conf; \
	echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf; \
	echo "pasv_enable=YES" >> /etc/vsftpd.conf; \
	echo -e "pasv_min_port=40000\npasv_max_port=40050" >> /etc/vsftpd.conf; \
	echo -e "userlist_enable=YES\nuserlist_file=/etc/vsftpd.userlist\nuserlist_deny=NO" >> /etc/vsftpd.conf;
COPY ./tools /tmp/
ENTRYPOINT [ "bash" ]
CMD [ "/tmp/ftp.sh" ]