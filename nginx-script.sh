#!/bin/bash

# Update package index
apt-get update

# Install NGINX
apt-get install -y nginx

# Start NGINX service
service nginx start

# Enable NGINX to start on boot
systemctl enable nginx
