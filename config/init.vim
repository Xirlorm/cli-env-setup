set nocompatible
filetype plugin on
set nu
set ruler
set title
" set spell
set nowrap
" set mouse=a
set hlsearch
set autoindent
set cursorline
set tabstop=2 
set shiftwidth=2
set softtabstop=2
set expandtab
set nrformats=bin
set background=dark
set redrawtime=10000
set undofile
set undodir=~/.cache/undo
let g:netrw_browse_split=4


" •••••••••••••••••••• Plugins ••••••••••••••••••••
" !! Do not use more than one autocompletion plugin simultaneously !!
call plug#begin("~/.nvim/plugged")

" Coc autocompletion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Neovim minimal autocompletion 
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'

" Emmet html extension
Plug 'mattn/emmet-vim'

" Night fox colorscheme
Plug 'EdenEast/nightfox.nvim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Linting Engine
Plug 'dense-analysis/ale'

" live-server
Plug 'manzeloth/live-server'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Vim multiselector
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Nerd tree
Plug 'scrooloose/nerdtree'

" Icons
Plug 'ryanoasis/vim-devicons'

call plug#end()
" ••••••••••••••••••••   ••••••••••••••••••••


" Coc extensions
" let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Initialize Coc Prettier extension
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1, '*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noinsert,noselect

" suppress annoying messages.
set shortmess+=c

" ALE completion
" set omnifunc=ale#completion#OmniFunc

" Neovim inbuilt completion
set omnifunc=syntaxcomplete#complete

if (has("termguicolors"))
set termguicolors
endif
syntax enable

" Set Colorscheme
colorscheme duskfox

" Syntax highlighting
syntax on

" Auto rust formatter
let g:rustfmt_autosave=1

" Select completion without progressing to new line
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

"Unhighlight text
nnoremap <esc> :noh<return><esc>
