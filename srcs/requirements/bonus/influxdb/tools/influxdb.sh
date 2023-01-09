# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    influxdb.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 19:08:27 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e /etc/influxdb/influxdb.conf ]; then
	echo -e "\n\e[3m\e[1;37m# --------------------------- Configuring InfluxDB --------------------------- #\e[0m\n"
	curl -Lk https://repos.influxdata.com/influxdb.key | apt-key add -
	echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" >> /etc/apt/sources.list.d/influxdb.list
	apt-get update -y
	apt-get install -y influxdb
	sed -i "s/# bind-address = \"127.0.0.1:8088\"/bind-address = \":8088\"/" /etc/influxdb/influxdb.conf
	service influxdb start
	influx -execute "CREATE USER $INFLUXDB_TELEGRAF_USERNAME WITH PASSWORD '$INFLUXDB_TELEGRAF_PASSWORD' WITH ALL PRIVILEGES" -database "$INFLUXDB_TELEGRAF_DBNAME"
	service influxdb stop
fi
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                               Starting InfluxDB                              \e[0m
\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n"
influxd