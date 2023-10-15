#!/usr/bin/bash

BLUE='\e[0;34m'
GREEN='\e[0;32m'
NC='\e[0m'

echo -e "${BLUE}Installing tools...${NC}"
# Install tools
pkg install clang python3 nodejs neovim tmux fzf bat tree -y

# Clean cache
echo -e "${BLUE}Cleaning cache...${NC}"
apt clean -y

echo -e "${BLUE}Writing .bashrc, .bash_profile, .tmux_conf...${NC}"
if [ -f ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc.bk
fi

if [ -f ~/.bash_profile ]; then
	mv ~/.bash_profile ~/.bash_profile.bk
fi

if [ -f ~/.tmux_conf ]; then
	mv ~/.tmux_conf ~/.tmux_conf.bk
fi

cat config/bashrc > ~/.bashrc
cat config/bash_profile > ~/.bash_profile
cat config/tmux.conf > ~/.tmux.conf

# Setting up neovim
if [ -d ~/.config/nvim ]; then
	echo -e "${BLUE}Backing up old neovim configuration...${NC}"
	mv ~/.config/nvim ~/.config/nvim.bk
fi

echo -e "${BLUE}Fetching neovim configuration...${NC}"

git clone "https://github.com/Xirlorm/nvim.git" ~/.config/nvim

echo -e "${BLUE}------- Done -------${NC}"
