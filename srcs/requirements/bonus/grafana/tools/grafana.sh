# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grafana.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/03 16:05:46 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
cp /tmp/defaults.ini $GF_PATHS_CONFIG;
sed -i "s/admin_password = admin/admin_password = $GF_ADMIN_PSWD/" $GF_PATHS_CONFIG;
grafana-server -config $GF_PATHS_CONFIG -homepath $GF_PATHS_HOME cfg:default.paths.logs=$GF_PATHS_LOGS;