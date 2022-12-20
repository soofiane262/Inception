#! /bin/bash
apt-get update -y;
apt-get upgrade -y;
apt-get install curl -y;
curl -Lk -o /cadvisor https://github.com/google/cadvisor/releases/download/v0.46.0/cadvisor-v0.46.0-linux-amd64;
chmod a+x /cadvisor;
./cadvisor;