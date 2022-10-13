set nocompatible
filetype plugin on

" set nu
set ruler
set title
" set spell
set nowrap
set mouse=a
set nonu rnu
set hlsearch
set autoindent
set cursorline
set nrformats=bin
set scrolloff=1000
set background=dark
set redrawtime=1000
" let g:netrw_browse_split=4
set undofile undodir=~/.cache/undo
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab


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

" Gruvbox colorscheme
 Plug 'gruvbox-community/gruvbox'

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
" Plug 'scrooloose/nerdtree'

" Icons
" Plug 'ryanoasis/vim-devicons'

call plug#end()
" •••••••••••••••••••• ••••••• ••••••••••••••••••••


" Coc extensions
" let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Initialize Coc Prettier extension
"  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

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

" Neovim inbuilt completion
" set omnifunc=syntaxcomplete#complete

if (has("termguicolors"))
  set termguicolors
endif

" Syntax highlighting
syntax on

" Set Colorscheme
colorscheme duskfox

" Auto rust formatter
let g:rustfmt_autosave=1

" Select completion option without progressing to new line
" inoremap <expr> <CR> pumvisible() ? \"\<C-Y>" : \"\<CR>"

"Unhighlight text
 nnoremap <esc> :noh<return><esc>
