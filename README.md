# Gatus Vultr Marketplace Application

This repository contains the resources to publish Gatus on the Vultr Marketplace. Gatus is a self-hosted monitoring tool for websites and APIs.

## Repository Structure

- `metadata/`: Contains metadata for Vultr Marketplace.
- `scripts/`: Shell scripts for installing and configuring Gatus.
- `packer/`: Packer template to build the Vultr image.

## Variables

The following variables are collected from users during deployment:

- `monitor_host`: Hostname or IP to monitor.
- `monitor_path`: Path to monitor (default: `/`).
- `monitor_port`: Port to monitor (default: `80`).
- `alert_threshold`: Number of failed checks before triggering an alert.
- `username`: Username to access the Gatus dashboard (default: `admin`).
- `password`: Password to access the Gatus dashboard (default: `password`).

## Accessing Gatus

Once deployed, access the Gatus dashboard at:

http://<instance_ip>:8080

Use the provided `username` and `password` to log in.

## How to Build the Image

1. Install [Packer](https://packer.io/).
2. Configure `packer/variables.json` with your Vultr API key and desired settings.
3. Run the following command to build the image:
   ```bash
   packer build -var-file=packer/variables.json packer/template.json
