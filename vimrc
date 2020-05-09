"execute pathogen#infect()
"execute pathogen#helptags()
set nocompatible

" Dein plugin management
set runtimepath+=~/.vim/bundles/dein.vim

if dein#load_state('~/.vim/bundles')
    call dein#begin('~/.vim/bundles')
    call dein#add('~/.vim/bundles/dein.vim')

    call dein#add('https://github.com/shougo/vinarise.vim')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

colorscheme wombat256

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

" Relative line numbering when in visual mode
nnoremap <silent> v v:<C-u>set rnu<CR>gv
nnoremap <silent> V V:<C-u>set rnu<CR>gv
nnoremap <silent> <C-v> <C-v>:<C-u>set rnu<CR>gv
vnoremap <Esc> <Esc>:set nornu nu<CR>
