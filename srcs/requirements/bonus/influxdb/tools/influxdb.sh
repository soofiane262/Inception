# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    influxdb.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/07 21:03:36 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e /etc/influxdb/influxdb.conf ]; then
	curl -Lk https://repos.influxdata.com/influxdb.key | apt-key add -
	echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" >> /etc/apt/sources.list.d/influxdb.list
	apt-get update -y
	apt-get install -y influxdb
	sed -i "s/# bind-address = \"127.0.0.1:8088\"/bind-address = \":8088\"/" /etc/influxdb/influxdb.conf
	service influxdb start
	influx -execute "CREATE DATABASE $INFLUXDB_DB_NAME"
	influx -execute "CREATE USER $INFLUXDB_USER_NAME WITH PASSWORD '$INFLUXDB_USER_PSWD' WITH ALL PRIVILEGES" -database "$INFLUXDB_DB_NAME"
	service influxdb stop
	sed -i "s/# auth-enabled = false/auth-enabled = true/" /etc/influxdb/influxdb.conf
fi
influxd