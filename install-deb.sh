#!/usr/bin/bash

echo "Installing tools..."
# Install tools
apt update
apt install g++ python3 nodejs npm neovim tmux fzf bat tree -y
# Clean cache
echo "cleaning cache..."
apt clean -y

printf "writing ~/bashrc ~/.bash_profile.. ~/.tmux.conf"
cat ./.bashrc >> ~/.bashrc
cat ./.bash_profile >> ~/.bash_profile
cat ./.tmux.conf >> ~/.tmux.conf

# Setting up neovim
printf "\nSetting up neovim...\n"
printf "Making directories .config/{nvim,undo} ..\n"
if [ ! -d ~/.config/ ]; then mkdir -p ~/.config/{nvim,undo};
elif [ ! -d ~/.config/nvim ]; then mkdir ~/.config/nvim;
  if [ ! -d ~/.config/undo ]; then mkdir ~/.config/undo; fi
fi

#×××××Write neovim config file×××××
if [ -f ~/.config/nvim/init.vim ]; then
  printf "\ninit.vim file exists!"
  cp ./init.vim >> ~/.config/nvim/init.vim
else
  printf "appending to init.vim\n"
  cp ./init.vim > ~/.config/nvim/init.vim
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
# tar zxf emmet.tar.gz -C ~/.config/nvim

# Install rust, cargo
# curl https://sh.rustup.rs -sSf | sh

printf "done!\n"
