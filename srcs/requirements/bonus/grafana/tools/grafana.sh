# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grafana.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/02 16:09:33 by sel-mars          #+#    #+#              #
#    Updated: 2023/01/02 16:09:50 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
cp /tmp/defaults.ini $GF_PATHS_CONFIG;
grafana-server -config $GF_PATHS_CONFIG -homepath $GF_PATHS_HOME cfg:default.paths.logs=$GF_PATHS_LOGS;