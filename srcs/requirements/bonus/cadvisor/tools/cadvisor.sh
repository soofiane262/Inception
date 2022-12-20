#! /bin/bash
apt-get update -y;
apt-get upgrade -y;
apt-get install curl -y;
curl -Lk -o /usr/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor;
chmod a+x /usr/bin/cadvisor;
cadvisor --port=$CADVISOR_PORT;