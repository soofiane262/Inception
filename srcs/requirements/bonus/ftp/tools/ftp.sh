# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftp.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 16:47:31 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/20 15:02:19 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
sed -i "s/secure_chroot_dir=.*/secure_chroot_dir=\/home\/$FTP_USER_NAME\/_empty/" /etc/vsftpd.conf;
useradd $FTP_USER_NAME;
echo -e "$FTP_USER_PSWD\n$FTP_USER_PSWD" | passwd $FTP_USER_NAME;
echo $FTP_USER_NAME >> /etc/vsftpd.userlist;
mkdir -p /home/$FTP_USER_NAME/_empty;
chown -R $FTP_USER_NAME:$FTP_USER_NAME /home/$FTP_USER_NAME;
chmod a-w /home/$FTP_USER_NAME/_empty;
vsftpd;