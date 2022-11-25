set nocompatible
filetype plugin on

" •••••••••••••••••••••• Plugins ••••••••••••••••••••••
call plug#begin()
" Colorschemes
 Plug 'EdenEast/nightfox.nvim'
 Plug 'sainnhe/sonokai'
 Plug 'sainnhe/edge'

" File explorer with icons
 " Plug 'scrooloose/nerdtree'
 " Plug 'ryanoasis/vim-devicons'

 " Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'skywind3000/vim-auto-popmenu'       " Completion
 Plug 'skywind3000/vim-dict'               " Completion dictionary
 Plug 'manzeloth/live-server'              " Live preview webpages
 Plug 'sheerun/vim-polyglot'               " Syntax highlighting
 Plug 'jiangmiao/auto-pairs'               " Auto pair brackets, quotes...
 Plug 'dense-analysis/ale'                 " Linter
 Plug 'mattn/emmet-vim'                    " Html completion
 Plug 'preservim/nerdcommenter'            " (Un)comment out lines quickly
 Plug 'vim-airline/vim-airline'            " Status line
 Plug 'vim-airline/vim-airline-themes'     " Status line themes
call plug#end()
" •••••••••••••••••••••••••••••••••••••••••••••••••••••

" set nu
set hls
set re=2
set ruler
set title
" set spell
set nowrap
set mouse=a
set nonu rnu
set autoindent
set cursorline
set nrformats=bin
let mapleader = 'g'
set scrolloff=1000
set background=dark
set redrawtime=100000
let g:netrw_browse_split=4
set undofile undodir=~/.cache/undo
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Coc language extensions
" let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-prettier']
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


set omnifunc=ale#completion#OmniFunc " ALE completion
" let g:ale_sign_error = '>>'        " Set ALE error sign
" let g:ale_sign_warning = '..'      " Set ALE warning sign
let g:ale_lint_on_save = 1

" Neovim completion
" set omnifunc=syntaxcomplete#complete

"Enable theme support
if (has('termguicolors'))
  set termguicolors
endif

" Edge colorscheme configurations
let g:edge_style = 'default'
let g:edge_better_performance = 1
let g:edge_dim_foreground = 0
let g:edge_disable_italic_comment = 1
let g:edge_transparent_background = 0
let g:edge_menu_selection_background = 'green'

" Sonokai colorscheme configurations
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:sonokai_dim_foreground = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 0
let g:sonokai_menu_selection_background = 'green'

" Enable theme
syntax on 
colorscheme edge


let g:rustfmt_autosave = 1       " Rust formatter

" statusline configurations
let g:airline_statusline_ontop = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'onedark'

" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" Comment paragraphs
nnoremap <silent> <leader>c} V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call nerdcommenter#Comment('x', 'toggle')<CR>


" Unhighlight text using escape key
 nnoremap <esc> :noh<return><esc>

" Go to next error
 nmap <silent> <C-e> <Plug>(ale_next_wrap)
