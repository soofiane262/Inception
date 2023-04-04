#! /bin/bash

# Set the color variables for the terminal
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# Check if the Telegraf configuration file exists; if not, install Telegraf
if [ ! -e /etc/telegraf/telegraf.conf ]; then
	# Add InfluxDB GPG key
	if ! curl -Lk https://repos.influxdata.com/influxdb.key | apt-key add -; then
		echo -e "${BOLD_RED}Failed to add the InfluxDB GPG key.${NO_COLOR}" >&2
		exit 1
	fi

	# Add the InfluxDB repository to the apt sources list
	echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" >>/etc/apt/sources.list.d/influxdb.list

	apt-get update -y           # Update apt package index
	apt-get install -y telegraf # Install Telegraf package

	# Copy the Telegraf configuration file to the appropriate directory
	cp /tmp/telegraf.conf /etc/telegraf/

	# Replace the placeholders with the actual values
	sed -i "s/domain-name/$DOMAIN_NAME/" /etc/telegraf/telegraf.conf
	sed -i "s/db-name/$INFLUXDB_TELEGRAF_DBNAME/" /etc/telegraf/telegraf.conf
	sed -i "s/influxdb-username/$INFLUXDB_TELEGRAF_USERNAME/" /etc/telegraf/telegraf.conf
	sed -i "s/influxdb-pswd/$INFLUXDB_TELEGRAF_PASSWORD/" /etc/telegraf/telegraf.conf
fi

# Print a success message to the terminal
echo -e "${BOLD_GREEN}Successfully installed Telegraf.${NO_COLOR}"

# Exit with a success code
exit 0
