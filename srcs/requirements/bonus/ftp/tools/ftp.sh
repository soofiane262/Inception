# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftp.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 16:47:31 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/10 15:29:19 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e /etc/vsftpd.userlist ]; then
	echo -e "\n\e[3m\e[1;37m# ---------------------------- Configuring FTP 1/2 --------------------------- #\e[0m\n"
	sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf
	sed -i "s/listen_ipv6=YES/#listen_ipv6=NO/" /etc/vsftpd.conf
	sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
	sed -i "0,/#chroot_local_user=YES/ s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf
	sed -i "s/secure_chroot_dir=.*/secure_chroot_dir=\/home\/www-data\/_empty/" /etc/vsftpd.conf
	echo "# Additional Configs" >> /etc/vsftpd.conf
	echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
	echo "pasv_enable=YES" >> /etc/vsftpd.conf
	echo -e "pasv_min_port=40000\npasv_max_port=40005" >> /etc/vsftpd.conf
	echo -e "userlist_enable=YES\nuserlist_file=/etc/vsftpd.userlist\nuserlist_deny=NO" >> /etc/vsftpd.conf
	useradd www-data
	echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | passwd www-data
	echo www-data >> /etc/vsftpd.userlist
	if [ ! -d /home/www-data/_empty ]; then
		echo -e "\n\e[3m\e[1;37m# ---------------------------- Configuring FTP 2/2 --------------------------- #\e[0m\n"
		mkdir -p /home/www-data/_empty
		chown -R www-data:www-data /home/www-data
		chmod a-w /home/www-data/_empty
	fi
fi
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                               Starting FTP Server                              \e[0m
\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n"
vsftpd