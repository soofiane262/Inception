# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grafana.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/09 17:45:14 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e $GF_PATHS_DASHBOARD ]; then
	echo -e "\n\e[3m\e[1;37m# ------------------------ Configuring Grafana Server ------------------------ #\e[0m\n"
	cp /tmp/defaults.ini $GF_PATHS_CONFIG
	cp /tmp/influxdb.yaml $GF_PATHS_DATASOURCE
	cp /tmp/docker.json $GF_PATHS_DASHBOARD
fi
echo -e "\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n
\e[3m\e[1;37m                            Starting Grafana Server                           \e[0m
\n\e[3m\e[1;37m# ---------------------------------------------------------------------------- #\e[0m\n"
grafana-server -config $GF_PATHS_CONFIG -homepath $GF_PATHS_HOME