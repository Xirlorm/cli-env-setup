#!/usr/bin/bash

# Install tools
echo 'Install gcc, python3, nodejs, npm, neovim, fzf, bat, tree, tmux...'
yes | pacman -Sy gcc python3 nodejs npm neovim tmux fzf bat tree
echo 'Cleaning cache...'
yes | pacman -Scc

echo 'Writing .bashrc, .bash_profile, .tmux_conf...'
cat config/.bashrc >> ~/.bashrc
cat config/.bash_profile >> ~/.bash_profile
cat config/.tmux.conf >> ~/.tmux.conf

# Setting up neovim
echo 'Writing neovim configuration...'
if [ ! -d ~/.config/ ]; then
  mkdir -p ~/.config/{nvim,undo};
elif [ ! -d ~/.config/nvim ]; then
  mkdir ~/.config/nvim;
fi

if [ -f ~/.config/nvim/init.vim ]; then
  echo 'Making backup of old init.vim as init.vim.bk ...'
  mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk
fi

cp config/init.vim ~/.config/nvim/init.vim


# Install vim plug
echo 'Installing vim plug...'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Upgrade vim plug and install selected plugins
echo 'Installing plugins...'
nvim -c 'PlugUpgrade|PlugInstall|qa'

echo 'Installing live-server...'
npm i -g live-server

# Install rust, cargo
echo 'Installing rust...'
curl "https://sh.rustup.rs" -sSf | sh

echo 'Done!'
