# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftp.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 16:47:31 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 13:25:09 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -d /home/$FTP_USER_NAME/_empty ]; then
	echo -e "\n\e[3m\e[1;37m# ------------------------------ Configuring FTP ----------------------------- #\e[0m\n"
	sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf
	sed -i "s/listen_ipv6=YES/#listen_ipv6=YES/" /etc/vsftpd.conf
	sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
	sed -i "0,/#chroot_local_user=YES/ s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf
	sed -i "s/secure_chroot_dir=.*/secure_chroot_dir=\/home\/$FTP_USER_NAME\/_empty/" /etc/vsftpd.conf
	echo "# Additional Configs" >> /etc/vsftpd.conf
	echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
	echo "pasv_enable=YES" >> /etc/vsftpd.conf
	echo -e "pasv_min_port=40000\npasv_max_port=40005" >> /etc/vsftpd.conf
	echo -e "userlist_enable=YES\nuserlist_file=/etc/vsftpd.userlist\nuserlist_deny=NO" >> /etc/vsftpd.conf
	useradd $FTP_USER_NAME
	echo -e "$FTP_USER_PSWD\n$FTP_USER_PSWD" | passwd $FTP_USER_NAME
	echo $FTP_USER_NAME >> /etc/vsftpd.userlist
	mkdir -p /home/$FTP_USER_NAME/_empty
	chown -R $FTP_USER_NAME:$FTP_USER_NAME /home/$FTP_USER_NAME
	chmod a-w /home/$FTP_USER_NAME/_empty
fi
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                               Starting FTP Server                              \e[0m
\e[3m\e[1;37m\n# ---------------------------------------------------------------------------- #\e[0m\n"
vsftpd