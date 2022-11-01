set nocompatible
filetype plugin on

" •••••••••••••••••••••• Plugins ••••••••••••••••••••••
call plug#begin()

" Language completion
 " Plug 'neoclide/coc.nvim', {'branch': 'release'}
 " let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-prettier']
 Plug 'skywind3000/vim-auto-popmenu'
 Plug 'skywind3000/vim-dict'

" Emmet html extension
 Plug 'mattn/emmet-vim'

" Colorschemes
 Plug 'EdenEast/nightfox.nvim'
 Plug 'fenetikm/falcon'
 Plug 'bluz71/vim-nightfly-guicolors'
 Plug 'dracula/vim'

" Syntax highlighting
 Plug 'sheerun/vim-polyglot'

" Linter
 Plug 'dense-analysis/ale'

" Live-server
 Plug 'manzeloth/live-server'

" Auto pairs
 Plug 'jiangmiao/auto-pairs'

" File explorer with icons
 " Plug 'scrooloose/nerdtree'
 " Plug 'ryanoasis/vim-devicons'

call plug#end()
" •••••••••••••••••••••••••••••••••••••••••••••••••••••

" set nu
set hls
set ruler
set title
" set spell
set nowrap
set mouse=a
set nonu rnu
set autoindent
set cursorline
set nrformats=bin
set scrolloff=1000
set redrawtime=100000
set re=2
set background=dark
let g:netrw_browse_split=4
set undofile undodir=~/.cache/undo
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Initialize Coc Prettier extension
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Skywind3000 vim completion configurations
" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1, '*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noinsert,noselect

" suppress annoying messages.
set shortmess+=c

" ALE completion
set omnifunc=ale#completion#OmniFunc

" Neovim completion
" set omnifunc=syntaxcomplete#complete

"Enable theme support
if (has('termguicolors'))
  set termguicolors
endif

" Enable theme
syntax on 
colorscheme nightfly

" Rust formatter
let g:rustfmt_autosave=1

"Unhighlight text
 nnoremap <esc> :noh<return><esc>
