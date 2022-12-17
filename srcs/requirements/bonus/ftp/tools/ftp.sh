# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftp.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 16:47:31 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/17 15:49:56 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
apt-get update -y;
apt-get upgrade -y;
apt-get install vsftpd -y;
sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf;
sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf;
sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf;
sed -i "0,/#chroot_local_user=YES/ s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf;
sed -i "s/secure_chroot_dir=.*/secure_chroot_dir=\/home\/souf\/ftp/" /etc/vsftpd.conf;
echo "# Additional Configs" >> /etc/vsftpd.conf;
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;
echo "pasv_enable=YES" >> /etc/vsftpd.conf;
echo -e "pasv_min_port=40000\npasv_max_port=40005" >> /etc/vsftpd.conf;
echo -e "userlist_enable=YES\nuserlist_file=/etc/vsftpd.userlist\nuserlist_deny=NO" >> /etc/vsftpd.conf;
useradd souf;
echo -e "souf123\nsouf123" | passwd souf;
echo souf >> /etc/vsftpd.userlist;
mkdir -p /home/souf/ftp;
chown souf:souf /home/souf/ftp;
chmod a-w /home/souf/ftp;
vsftpd;