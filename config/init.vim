set nocompatible
filetype on
filetype plugin on
filetype indent on

" @@@@@@@@@@@@@@@@@@@@@@@@@@ Plugins @@@@@@@@@@@@@@@@@@@@@@@@@@
call plug#begin()
" Colorschemes
Plug 'EdenEast/nightfox.nvim'
Plug 'sainnhe/edge'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'

" File explorer with icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}    " Coc completion
Plug 'skywind3000/vim-auto-popmenu'                " Completion
Plug 'skywind3000/vim-dict'                        " Completion dictionary
Plug 'manzeloth/live-server'                       " Live preview webpages
Plug 'sheerun/vim-polyglot'                        " Syntax highlighting
Plug 'jiangmiao/auto-pairs'                        " Auto pair brackets, quotes...
Plug 'dense-analysis/ale'                          " Linting engine
Plug 'mattn/emmet-vim'                             " Html completion
Plug 'preservim/nerdcommenter'                     " (Un)comment out lines quickly
Plug 'vim-airline/vim-airline'                     " Status line
Plug 'vim-airline/vim-airline-themes'              " Status line themes
Plug 'rust-lang/rust.vim'                          " Rust plugin
Plug 'ap/vim-css-color'                            " Display CSS color codes in nvim
call plug#end()
" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

set hls
set re=2
set ruler
set title
" set spell
set nowrap
set mouse=a
set confirm
set nonu rnu
set wildmenu
" set visualbell
set autoindent
set cursorline
set scrolloff=10
set nrformats=bin
set encoding=utf-8
let mapleader = 'g'
set background=dark
set redrawtime=100000
let g:netrw_browse_split=4
set undofile undodir=~/.cache/.nvim-undo
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set omnifunc=syntaxcomplete#Complete " Neovim completion

if (has('termguicolors'))
  set termguicolors
endif
syntax on                         " Turn on syntax highlighting
colorscheme jellybeans            " Set colorscheme

let g:rustfmt_autosave = 1        " On save, formats rust code

" Unhighlight text using escape key
nnoremap <esc> :noh<return><esc>


" %%%%%%%%%%%%%%%% Coc Completion configuration %%%%%%%%%%%%%%%%%
" Coc language extensions
" let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-prettier', 'coc-rust-analyzer']
" Initialize Coc Prettier extension
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument


" %%%%%%%%%%%%%%%% Vim dict Config %%%%%%%%%%%%%%%%%

let g:apc_enable_ft = {'text':1, 'markdown':1, '*':1} " enable this plugin for filetypes, '*' for all files
set cpt=.,k,w,b                                       " source for dictionary, current or other loaded buffers, see ':help cpt'
set completeopt=menu,menuone,noinsert,noselect        " don't select the first item.
set shortmess+=c                                      " suppress annoying messages.


" %%%%%%%%%%%%%%%% ALE Configuration %%%%%%%%%%%%%%%%%
" set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_error = ' ✗'
let g:ale_sign_warning = ' '
let g:ale_lint_on_save = 1
let g:ale_linters = {
      \'javascript': ['eslint'],
      \'rust': ['analyzer'],
      \}
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \'javascript': ['eslint', 'prettier'],
      \'typescript': ['eslint','tslint', 'xo'],
      \'css': ['stylelint', 'fecs', 'prettier'],
      \'rust': ['rustfmt', 'rls'],
      \}
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Go to next error
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" Show number of errors and warnings
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}



" %%%%%%%%%%%%%%%% Edge colorscheme config %%%%%%%%%%%%%%%%
" Edge colorscheme configurations
let g:edge_style = 'default'
let g:edge_better_performance = 1
let g:edge_dim_foreground = 0
let g:edge_disable_italic_comment = 0
let g:edge_transparent_background = 0
let g:edge_menu_selection_background = 'green'
let g:edge_disable_terminal_colors = 1


" %%%%%%%%%%%%%%%% Airline config %%%%%%%%%%%%%%%%
let g:airline_statusline_ontop = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'night_owl'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1


" %%%%%%%%%%%%%%%% NERDtree Config %%%%%%%%%%%%%%%%%
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
