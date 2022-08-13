set nu
set ruler
"set spell
set nowrap
set mouse=a
set autoindent
set cursorline
set tabstop=2
set shiftwidth=2 
set softtabstop=2
set expandtab
set redrawtime=10000
let g:netrw_browse_split=4
set undofile
set undodir=~/.config/undo


" •••••••••••••••••••• Plugins ••••••••••••••••••••
" !! Do not use more than one autocompletion plugin simultaneously !!
call plug#begin()

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

" Vim multiselector
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Nerd tree
" Plug 'scrooloose/nerdtree'

" Icons
" Plug 'ryanoasis/vim-devicons'

call plug#end()

" ••••••••••••••••••••Neovim completion config ••••••••••••••••••••
" ----------- Neovim mininal completion config -----------
" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1, '*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoying messages.
set shortmess+=c

" ----------- Other completions config -----------
" ALE completion
" set omnifunc=ale#completion#OmniFunc

" Neovim completion
" set omnifunc=syntaxcomplete#complete




" Set Colorscheme
colorscheme duskfox

" Syntax highlighting
syntax on

" Initialize Coc Prettier extension
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Auto rust formatter
let g:rustfmt_autosave = 1

" Select completion without progressing to new line
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

"Unhighlight text
nnoremap <esc> :noh<return><esc>
