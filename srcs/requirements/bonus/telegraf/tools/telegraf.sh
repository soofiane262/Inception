# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    telegraf.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 18:33:08 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e /etc/telegraf/telegraf.conf ]; then
	echo -e "\n\e[3m\e[1;37m# --------------------------- Configuring Telegraf --------------------------- #\e[0m\n"
	curl -Lk https://repos.influxdata.com/influxdb.key | apt-key add -
	echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" >> /etc/apt/sources.list.d/influxdb.list
	apt-get update -y
	apt-get install -y telegraf
	cp /tmp/telegraf.conf /etc/telegraf/
	sed -i "s/domain-name/$DOMAIN_NAME/" /etc/telegraf/telegraf.conf
	sed -i "s/db-name/$INFLUXDB_TELEGRAF_DBNAME/" /etc/telegraf/telegraf.conf
	sed -i "s/influxdb-username/$INFLUXDB_TELEGRAF_USERNAME/" /etc/telegraf/telegraf.conf
	sed -i "s/influxdb-pswd/$INFLUXDB_TELEGRAF_PASSWORD/" /etc/telegraf/telegraf.conf
fi
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                               Starting Telegraf                              \e[0m
\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n"
telegraf