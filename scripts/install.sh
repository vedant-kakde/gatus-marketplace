#!/bin/bash

# Update the package manager and install dependencies
apt-get update -y
apt-get install -y docker.io curl

# Create directories for Gatus configuration
CONFIG_DIR="/etc/gatus"
mkdir -p $CONFIG_DIR

# Run configuration script to generate config.yaml dynamically
bash /scripts/configure.sh

# Run Gatus using Docker with the generated config
docker run -d -p 8080:8080 \
  -v $CONFIG_DIR/config.yaml:/config/config.yaml \
  twinproduction/gatus

echo "Gatus installation complete. Access it on port 8080 with the configured username and password."
