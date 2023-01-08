# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grafana.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/08 20:12:30 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e $GF_PATHS_CONFIG ]; then
	cp /tmp/defaults.ini $GF_PATHS_CONFIG
	cp /tmp/influxdb.yaml $GF_PATHS_DATASOURCE
	cp /tmp/docker.json $GF_PATHS_DASHBOARD
fi
grafana-server -config $GF_PATHS_CONFIG -homepath $GF_PATHS_HOME cfg:default.paths.logs=$GF_PATHS_LOGS