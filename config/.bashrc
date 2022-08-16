#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

# User defined prompt variable
PS1='[\u@\h \[\033[0;33m\]\W\[\033[0;0m\]]\$ '

# User defined aliases
alias vim='nvim'
alias py='python'
alias 2c.='cd ../../'
alias 3c.='cd ../../..'
alias 4c.='cd ../../../..'
alias whatis='whatis -l'
alias bat='bat --theme OneHalfDark'
alias server='python -m http.server'
alias tree='tree -C --gitignore --filesfirst'
alias jsinfo='server -d ~/.offline-docs/js.info 4040'

gcl() {
  git clone "git@github.com:Xirlorm/$1.git"
}

gra() {
  git remote add origin "git@github.com:Xirlorm/$1.git"
  git push --set-upstream origin main
}

. "$HOME/.cargo/env"
