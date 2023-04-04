#! /bin/bash

# Define some color constants for better readability
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# Check if InfluxDB is not already installed and configured
if [ ! -e /etc/influxdb/influxdb.conf ]; then
	# Add InfluxDB GPG key for package verification
	if ! curl -Lk https://repos.influxdata.com/influxdb.key | apt-key add -; then
		# Print error message if adding GPG key fails and exit with status code 1
		echo -e "${BOLD_RED}Failed to add the InfluxDB GPG key.${NO_COLOR}" >&2
		exit 1
	fi

	# Add InfluxDB package repository to apt sources
	echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" >>/etc/apt/sources.list.d/influxdb.list

	# Update package list and install InfluxDB
	apt-get update -y
	apt-get install -y influxdb

	# Set InfluxDB bind address to listen on all network interfaces on port 8088
	sed -i "s/# bind-address = \"127.0.0.1:8088\"/bind-address = \":8088\"/" /etc/influxdb/influxdb.conf

	# Start InfluxDB service
	service influxdb start

	# Create a new InfluxDB user with full access to the specified database
	influx -execute "CREATE USER $INFLUXDB_TELEGRAF_USERNAME WITH PASSWORD '$INFLUXDB_TELEGRAF_PASSWORD' WITH ALL PRIVILEGES" -database "$INFLUXDB_TELEGRAF_DBNAME"

	# Stop InfluxDB service
	service influxdb stop
fi

# Print a success message to the terminal
echo -e "${BOLD_GREEN}Successfully installed InfluxDB.${NO_COLOR}"

# Exit with a success code
exit 0
