#!/bin/bash

# Update package repository
sudo apt update

# Install dependencies
sudo apt install -y \
  curl \
  git \
  build-essential

# Install rustup (Rust toolchain installer)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add cargo (Rust package manager) to PATH
source $HOME/.cargo/env

# Install bob using cargo
cargo install --git https://github.com/MordechaiHadad/bob.git

# Set up bob in the shell configuration file
if [ -f ~/.zshrc ]; then
  SHELL_RC_FILE=~/.zshrc
else
  SHELL_RC_FILE=~/.bashrc
fi

echo -e '\n# Bob setup' >> $SHELL_RC_FILE
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $SHELL_RC_FILE
echo 'export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"' >> $SHELL_RC_FILE

# Reload shell configuration
source $SHELL_RC_FILE

# Verify bob installation
bob --version

echo "bob installed successfully."
