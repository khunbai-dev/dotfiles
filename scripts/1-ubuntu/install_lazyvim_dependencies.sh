#!/bin/bash

# Check if npm is installed
if command -v npm &> /dev/null; then
  # Update package repository
  sudo apt update

  # Install pip
  sudo apt install -y python3-pip
  
  # Install ripgrep (rg)
  sudo apt install -y ripgrep
  
  # Install fd-find
  sudo apt install -y fd-find
  
  # Install unzip
  sudo apt install -y unzip
  
  # Set up fd symlink
  mkdir -p ~/.local/bin
  ln -s $(which fdfind) ~/.local/bin/fd
  
  # Determine the shell configuration file
  if [ -f ~/.zshrc ]; then
    SHELL_RC_FILE=~/.zshrc
  else
    SHELL_RC_FILE=~/.bashrc
  fi
  
  # Add local bin to PATH
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> $SHELL_RC_FILE
  
  # Reload shell configuration
  source $SHELL_RC_FILE
  
  # Install lazygit
  sudo add-apt-repository ppa:lazygit-team/release -y
  sudo apt update
  sudo apt install -y lazygit
  
  npm install -g neovim
  npm install -g tree-sitter-cli
  
  echo "Installation of ripgrep, fd-find, unzip, and lazygit is complete."
else
  echo "npm is not installed. Please install Node.js and npm first."
fi
