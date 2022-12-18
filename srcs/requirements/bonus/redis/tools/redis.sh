# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    redis.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-mars <sel-mars@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 22:06:57 by sel-mars          #+#    #+#              #
#    Updated: 2022/12/18 22:07:35 by sel-mars         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash
apt-get update -y;
apt-get upgrade -y;
apt-get install redis-server -y;
sed -i "s/127.0.0.1/0.0.0.0/" /etc/redis/redis.conf;
redis-server --protected-mode no;