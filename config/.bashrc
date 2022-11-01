
# User defined aliases
alias python='python3'
alias bat='batcat'
alias cd2='cd ../../'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias whatis='whatis -l'
alias bat='batcat --theme OneHalfDark'
alias server="python3 -m http.server"
alias tree='tree -C --gitignore --filesfirst'
alias jsinfo='server -d ~/.offline-docs/js.info 4040'

gcl() {
  git clone "git@github.com:Xirlorm/$1.git"
}

gra() {
  git remote add origin "git@github.com:Xirlorm/$1.git"
  git push --set-upstream origin main
}

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
