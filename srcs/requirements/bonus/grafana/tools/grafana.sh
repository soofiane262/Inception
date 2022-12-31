#! /bin/bash
cp /tmp/defaults.ini $GF_PATHS_CONFIG;
grafana-cli grafana-cli admin reset-admin-password $GF_ADMIN_PSWD;
grafana-server -config $GF_PATHS_CONFIG -homepath $GF_PATHS_HOME cfg:default.paths.logs=$GF_PATHS_LOGS;