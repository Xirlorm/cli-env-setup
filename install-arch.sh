#!/usr/bin/bash

# Install tools
printf "\nInstall programming tools\n"
yes|pacman -S gcc python3 nodejs npm neovim tmux fzf bat tree w3m
# Clean cache
printf "\nCleaning cache...\n"
yes|pacman -Scc

printf "writing ~/bashrc ~/.bash_profile.. ~/.tmux.conf"
mv ~/.bashrc ~/.bashrc.bk
cat config/.bashrc > ~/.bashrc
if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile.bk
fi
cat config/.bash_profile > ~/.bash_profile
if [ -f ~/.tmux.conf ]; then
  mv  ~/.tmux.conf  ~/.tmux.conf.bk
fi
cat config/.tmux.conf > ~/.tmux.conf

# Setting up neovim
printf "\nSetting up neovim...\n"
printf "Making directories .config/{nvim,undo} ..\n"
if [ ! -d ~/.config/ ]; then mkdir -p ~/.config/{nvim,undo};
elif [ ! -d ~/.config/nvim ]; then mkdir ~/.config/nvim;
  if [ ! -d ~/.config/undo ]; then mkdir ~/.config/undo; fi
fi

#×××××Write neovim config file×××××
if [ -f ~/.config/nvim/init.vim ]; then
  printf "Making backup of old init.vim as init.vim.bk..."
  mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk
  cp config/init.vim ~/.config/nvim/init.vim
else
  cp config/init.vim ~/.config/nvim/init.vim
fi


# Install vim plug
printf "\nInstalling vim plug...\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Upgrade vim plug and install selected plugins
nvim -c 'PlugUpgrade|PlugInstall|qa'

# Enable for coc plugin extensions for web development
# nvim -c 'CocInstall -sync coc-json coc-css coc-prettier coc-pairs coc-tsserver coc-html|qa'
# npm i -g live-server

# Unpack emmet
# tar zxf ./pkgs/emmet.tar.gz -C ~/.config/nvim

# Install rust, cargo
curl https://sh.rustup.rs -sSf | sh

printf "done!\n"
