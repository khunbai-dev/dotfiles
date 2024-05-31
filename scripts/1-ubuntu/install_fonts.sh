#!/bin/bash

# Install fontconfig
sudo apt update
sudo apt install -y fontconfig

# Define font URLs
FONT_URL1="https://gitlab-org.gitlab.io/frontend/fonts/fonts/GitLabMono.ttf"
FONT_URL2="https://gitlab-org.gitlab.io/frontend/fonts/fonts/GitLabMono-Italic.ttf"

# Define font destination directory
FONT_DIR="/usr/local/share/fonts"

# Create the font directory if it doesn't exist
sudo mkdir -p $FONT_DIR

# Download the fonts
sudo wget -O $FONT_DIR/GitLabMono.ttf $FONT_URL1
sudo wget -O $FONT_DIR/GitLabMono-Italic.ttf $FONT_URL2

# Update font cache
sudo fc-cache -f -v

# Verify installation
fc-list | grep "GitLabMono"

echo "Fonts installed successfully."