# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    website.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/07 21:18:39 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
tail -f
if [ ! -e /etc/telegraf/telegraf.conf ]; then
	apt-get install -y wget curl gnupg2 lsb-release ca-certificates apt-transport-https software-properties-common procps
	curl -Lk https://repos.influxdata.com/influxdb.key | apt-key add -
	echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" >> /etc/apt/sources.list.d/influxdb.list
	apt-get update -y
	apt-get install -y telegraf
	cp /tmp/telegraf.conf /etc/telegraf/
	sed -i "s/domain-name/$DOMAIN_NAME/" /etc/telegraf/telegraf.conf
	sed -i "s/db-name/$INFLUXDB_DB_NAME/" /etc/telegraf/telegraf.conf
	sed -i "s/influxdb-username/$INFLUXDB_USER_NAME/" /etc/telegraf/telegraf.conf
	sed -i "s/influxdb-pswd/$INFLUXDB_USER_PSWD/" /etc/telegraf/telegraf.conf
fi
telegraf