execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

colorscheme wombat256

set fileencodings=utf-8,latin1

set nocompatible
set autoindent
set expandtab
set formatoptions=crql
set guifont=Source_Code_Pro:h9:cANSI
set guioptions=act
set mouse=n
set nowrap
set number
set cursorline
set scrolloff=6
set shiftwidth=4
set smartindent
set splitbelow
set splitright
set tabstop=4
set wildchar=<tab>
set wildmenu
set wildmode=list:longest
"set list listchars=tab:→\ ,trail:␣,nbsp:␣
map Q <nop>

" Put swaps elsewhere, and create undofiles
set dir=~/.vimlocal/swap
set undodir=~/.vimlocal/undo
set undofile

let g:syntastic_cpp_compiler_options='-std=c++11'

vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight
