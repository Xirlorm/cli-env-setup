#!/usr/bin/bash

echo "Installing tools..."
# Install tools
sudo apt update
sudo apt install gcc python3 nodejs npm neovim tmux fzf bat tree w3m -y

# Clean cache
echo "cleaning cache..."
sudo apt clean -y

printf "Writing .bashrc, .bash_profile, .tmux_conf...\n"
cat config/.bashrc >> ~/.bashrc
cat config/.bash_profile >> ~/.bash_profile
cat config/.tmux.conf >> ~/.tmux.conf

# Setting up neovim
printf "Writing neovim configuration...\n"
if [ ! -d ~/.config/ ]; then
  mkdir -p ~/.config/{nvim,undo};
elif [ ! -d ~/.config/nvim ]; then
  mkdir ~/.config/nvim;
fi

if [ -f ~/.config/nvim/init.vim ]; then
  printf "Making backup of old init.vim as init.vim.bk ...\n"
  mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk
fi

cp config/init.vim ~/.config/nvim/init.vim


# Install vim plug
printf "Installing vim plug...\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Upgrade vim plug and install selected plugins
printf "Installing plugins...\n"
nvim -c 'PlugUpgrade|PlugInstall|qa'

printf "Installing live-server...\n"
npm i -g live-server

# Install rust, cargo
printf "Installing rust...\n"
curl https://sh.rustup.rs -sSf | sh

printf "Done!\n"
