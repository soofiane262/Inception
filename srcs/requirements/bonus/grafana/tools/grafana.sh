# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grafana.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/06 22:20:36 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
if [ ! -e $GF_PATHS_CONFIG ]; then
	cp /tmp/defaults.ini $GF_PATHS_CONFIG
	sed -i "s/admin_password = admin/admin_password = $GF_ADMIN_PSWD/" $GF_PATHS_CONFIG
	sed -i "s/domain_name/$DOMAIN_NAME/" $GF_PATHS_CONFIG
fi
grafana-server -config $GF_PATHS_CONFIG -homepath $GF_PATHS_HOME cfg:default.paths.logs=$GF_PATHS_LOGS