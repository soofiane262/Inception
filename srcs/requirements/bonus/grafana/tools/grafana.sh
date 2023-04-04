#! /bin/bash

# Define some color codes for output
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

# Check if Grafana dashboard is installed
if [ ! -e "$GF_PATHS_DASHBOARD" ]; then

	# Copy default config files to the appropriate directories
	cp /tmp/defaults.ini "$GF_PATHS_CONFIG"
	cp /tmp/influxdb.yaml "$GF_PATHS_DATASOURCE"
	cp /tmp/docker.json "$GF_PATHS_DASHBOARD"
fi

# Output success message
echo -e "${BOLD_GREEN}Successfully installed Grafana.${NO_COLOR}"

# Exit with a success code
exit 0
