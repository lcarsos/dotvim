execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

colorscheme wombat256

set nocompatible
set autoindent
set expandtab
set formatoptions=crql
set guioptions=act
set mouse=n
set nowrap
set number
set ruler
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
map Q <nop>

"Set the gui font specific to which machine I'm on
if has("win32")
    set guifont=Source_Code_Pro_Medium:h9:cANSI
else
    set guifont=Source\ Code\ Pro\ 7
    set list listchars=tab:→\ ,trail:␣,nbsp:␣
endif

" Put swaps elsewhere, and create undofiles
set dir=~/.vimlocal/swap
set nobackup
set undodir=~/.vimlocal/undo
set undofile

"Shamelessly stolen from scrooloose's vimrc
"statusline setup
set statusline =%#identifier#
set statusline+=[%f]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

" Vim plugin configurations

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:systastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options='-std=c++14'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_quiet_messages={"regex":'\m\[\(E124\|E127\|E501\|F401\)\]'}
let g:syntastic_python_pylint_quiet_messages={"regex":'\m\[\(fixme\|invalid-name\|too-few-public-methods\|no-member\)\]'}

" neocomplete.vim
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1

vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" Relative line numbering when in visual mode
nnoremap <silent> v v:<C-u>set rnu<CR>gv
nnoremap <silent> V V:<C-u>set rnu<CR>gv
nnoremap <silent> <C-v> <C-v>:<C-u>set rnu<CR>gv
vnoremap <Esc> <Esc>:set nornu nu<CR>
