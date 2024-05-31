#!/bin/bash

# Update package repository
sudo apt update

# Install dependencies for pyenv
sudo apt install -y \
  make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libffi-dev \
  liblzma-dev \
  git

# Determine shell configuration file
if [ -f ~/.zshrc ]; then
  SHELL_RC_FILE=~/.zshrc
else
  SHELL_RC_FILE=~/.bashrc
fi

# Install pyenv
curl https://pyenv.run | bash

# Add pyenv to shell configuration file
echo -e '\n# Pyenv setup' >> $SHELL_RC_FILE
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $SHELL_RC_FILE
echo 'eval "$(pyenv init --path)"' >> $SHELL_RC_FILE
echo 'eval "$(pyenv init -)"' >> $SHELL_RC_FILE
echo 'eval "$(pyenv virtualenv-init -)"' >> $SHELL_RC_FILE

# Reload shell configuration
source $SHELL_RC_FILE

# Verify pyenv installation
pyenv --version

# Install dependencies for nvm
sudo apt install -y \
  build-essential \
  libssl-dev

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Add nvm to shell configuration file
echo -e '\n# NVM setup' >> $SHELL_RC_FILE
echo 'export NVM_DIR="$HOME/.nvm"' >> $SHELL_RC_FILE
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $SHELL_RC_FILE
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $SHELL_RC_FILE

# Reload shell configuration
source $SHELL_RC_FILE

# Verify nvm installation
nvm --version

echo "pyenv and nvm installed successfully."