#! /bin/bash

# Set the color variables for the terminal
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# Check if the userlist file exists; if not, configure vsftpd
if [ ! -e /etc/vsftpd.userlist ]; then

	# Enable FTP, disable IPv6, and allow write access
	sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf
	sed -i "s/listen_ipv6=YES/#listen_ipv6=NO/" /etc/vsftpd.conf
	sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

	# Configure chroot and secure chroot
	sed -i "0,/#chroot_local_user=YES/ s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf
	sed -i "s/secure_chroot_dir=.*/secure_chroot_dir=\/home\/$FTP_USERNAME\/_empty/" /etc/vsftpd.conf

	# Add additional configurations
	cat <<EOF >>/etc/vsftpd.conf
# Additional Configs
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40005
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
EOF

	# Create a new user and group
	groupadd www-pub
	useradd "$FTP_USERNAME"
	echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | passwd "$FTP_USERNAME"
	usermod -aG www-pub "$FTP_USERNAME"

	# Add the new user to the userlist
	echo "$FTP_USERNAME" >>/etc/vsftpd.userlist

	# Set ownership and permissions for the new user's directory
	chown -R "$FTP_USERNAME":www-pub /home/"$FTP_USERNAME"
	chmod 2775 /home/"$FTP_USERNAME"
	mkdir -p /home/"$FTP_USERNAME"/_empty
	chmod a-w /home/"$FTP_USERNAME"/_empty

fi

# Print a success message to the terminal
echo -e "${BOLD_GREEN}Successfully configured vsftpd.${NO_COLOR}"
