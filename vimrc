"execute pathogen#infect()
"execute pathogen#helptags()
set nocompatible

" Dein plugin management
set runtimepath+=~/.cache/vim/bundles/repos/github.com/shougo/dein.vim

if dein#load_state('~/.cache/vim/bundles')
    call dein#begin('~/.cache/vim/bundles')
    "ugh. I hate this path crap that dein forces you into
    call dein#add('~/.cache/vim/bundles/repos/github.com/shougo/dein.vim')

    " List of plugins
    " ale
    call dein#add('https://github.com/dense-analysis/ale')

    " deoplete
    call dein#add('https://github.com/shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('https://github.com/roxma/nvim-yarp')
        call dein#add('https://github.com/roxma/vim-hug-neovim-rpc')
    endif

    " deoplete-jedi
    call dein#add('https://github.com/deoplete-plugins/deoplete-jedi')

    " deoplete-zsh
    call dein#add('https://github.com/deoplete-plugins/deoplete-zsh')

    " deoplete-rust
    call dein#add('https://github.com/sebastianmarkow/deoplete-rust')

    " rust.vim
    call dein#add('https://github.com/rust-lang/rust.vim')

    " vinarise
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
set dir=~/.local/share/vim/swap
set nobackup
set undodir=~/.local/share/vim/undo
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
let g:deoplete#enable_at_startup = 1

" deoplete configs
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#sources#rust#racer_binary='/home/echo/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/echo/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src'
" Uncomment to limit deoplete to only ale-fueled completions
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\})

" Relative line numbering when in visual mode
nnoremap <silent> v v:<C-u>set rnu<CR>gv
nnoremap <silent> V V:<C-u>set rnu<CR>gv
nnoremap <silent> <C-v> <C-v>:<C-u>set rnu<CR>gv
vnoremap <Esc> <Esc>:set nornu nu<CR>
