#!/usr/bin/bash

echo "Upgrading system and installing programming tools..."

#########################
# DEBIAN
#########################
# apt update -y && apt upgrade -y
# apt install neovim g++ git fzf nodejs npm bat tree tmux w3m python -y
# apt clean -y

#########################
# ARCH
#########################
# yes | pacman -Syu
# yes | pacman -S neovim gcc git fzf nodejs npm bat tree tmux w3m python -y
# yes | pacman -Scc



#++++++++++++++++++++++++
# SETUP NEOVIM
#++++++++++++++++++++++++

echo "Setting up neovim..."

if [ ! -d ~/.config/ ]; then
  mkdir ~/.config/
  #×××××Create neovim directory if it does not exist×××××
  if [ ! -d ~/.config/nvim/ ]; then
    mkdir ~/.config/nvim/
  fi
  if [ -d ~/.config/undo/ ]; then
    echo "~/.config/undo exists!"
    echo -n "do you want to rewrite it?"
    read user_input
    if [ $user_input == "yes" ]; then
      mkdir ~/.config/undo/
    fi
  fi
fi


#×××××Write neovim config script×××××
write_neovim_config  () {
  echo "set nu
  set ruler
  set nowrap
  \"set mouse=a
  set autoindent
  set cursorline
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2 
  set redrawtime=10000
  set undofile
  set undodir=~/.config/undo
  \"set spell
  let g:netrw_browse_split=4

  call plug#begin()
  \" Coc autocompletion
  \"Plug 'neoclide/coc.nvim', {'branch': 'release'}
  \" Emmet html extension
  Plug 'mattn/emmet-vim'
  \" Night fox colorscheme
  Plug 'EdenEast/nightfox.nvim'
  \" Syntax highlighting
  Plug 'sheerun/vim-polyglot'
  \" Linting
  Plug 'dense-analysis/ale'
  \" Autocompletion minimal
  Plug 'skywind3000/vim-auto-popmenu'
  Plug 'skywind3000/vim-dict'
  \" Vim multiselector
  \"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  \" Nerd tree
  \"Plug 'scrooloose/nerdtree'
  \" Icons
  \"Plug 'ryanoasis/vim-devicons'
  call plug#end()

  \"Set Colorscheme
  colorscheme duskfox
  \"Turn syntax highlighting on
  syntax on

  \"Start Prettier extension
  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

  \" enable this plugin for filetypes, '*' for all files.
  let g:apc_enable_ft = {'text':1, 'markdown':1, '*':1}

  \" source for dictionary, current or other loaded buffers, see ':help cpt'
  set cpt=.,k,w,b

  \" don't select the first item.
  set completeopt=menu,menuone,noselect

  \" suppress annoying messages.
  set shortmess+=c

  inoremap <expr> <CR> pumvisible() ? \"\\<C-Y>\" : \"\\<CR>\"
  nnoremap <esc> :noh<return><esc>

  \" Auto rust formatter
  \"let g:rustfmt_autosave = 1" >> ~/.config/nvim/init.vim
}

#×××××Write neovim config file×××××
if [ -f ~/.config/nvim/init.vim ]; then
  echo "init.vim file exists!"
  echo -n "Would you like to rewrite it?(yes,no) "
  read user_input
  if [ $user_input == "yes" ]; then
    rm ~/.config/nvim/init.vim
    write_neovim_config
  fi
else
  write_neovim_config
fi

#×××××setup emmet×××××
tar zxf emmet.tar.gz -C ~/.config/nvim
#×××××Install vim plug×××××
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#×××××Install plugins and extensions×××××
nvim -c 'PlugUpgrade|qa'
nvim -c 'PlugInstall|qa'
#nvim -c 'CocInstall -sync coc-json coc-css coc-prettier coc-pairs coc-tsserver coc-html|q'
#curl https://sh.rustup.rs -sSf | sh
echo "done!";
echo ""
