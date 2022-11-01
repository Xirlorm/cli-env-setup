# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

PATH=$PATH:$HOME/bin
export PATH
export EDITOR='nvim'
export BROWSER='w3m' 
export HISTCONTROL=ignoredups
. "$HOME/.cargo/env"
