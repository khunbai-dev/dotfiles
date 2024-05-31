#!/bin/bash

# Reference: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04

# Step 1: Update the package repository
sudo apt update

# Step 2: Install Docker if it's not already installed
sudo apt install -y docker.io

# Step 3: Enable Docker to start on boot
sudo systemctl enable docker

# Step 4: Start Docker
sudo systemctl start docker

# Step 5: Install dependencies required for Docker Compose
sudo apt install -y curl jq

# Step 6: Download the latest version of Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Step 7: Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Step 8: Verify the installation
docker-compose --version

echo "Docker Compose installed successfully."
