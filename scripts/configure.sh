#!/bin/bash

# Capture variables from the environment or use defaults
HOST=${monitor_host:-"example.com"}
PATH=${monitor_path:-"/"}
PORT=${monitor_port:-"80"}
ALERT_THRESHOLD=${alert_threshold:-"3"}
USERNAME=${username:-"admin"}
PASSWORD=${password:-"password"}

# Define the Gatus configuration directory
CONFIG_DIR="/etc/gatus"

# Generate the config.yaml file
cat <<EOF > $CONFIG_DIR/config.yaml
services:
  - name: Service Monitoring
    url: http://${HOST}:${PORT}${PATH}
    conditions:
      - "[STATUS] == 200"
    alerts:
      - type: slack
        failure-threshold: ${ALERT_THRESHOLD}
        success-threshold: 1
        description: "Service at ${HOST}:${PORT} is down!"
        send-on-resolved: true

security:
  basic:
    username: "${USERNAME}"
    password: "${PASSWORD}"
EOF

echo "Gatus configuration generated at $CONFIG_DIR/config.yaml"
