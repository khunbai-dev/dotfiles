#!/bin/bash

# Download Neovim 0.10.0
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage

# Make the AppImage executable
chmod u+x nvim.appimage

# Move the AppImage to /usr/local/bin
sudo mv nvim.appimage /usr/local/bin/nvim

# Optionally create a symlink
sudo ln -s /usr/local/bin/nvim /usr/bin/nvim

# Verify the installation
nvim --version
