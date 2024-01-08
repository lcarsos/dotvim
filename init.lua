vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

require('plugins')

require('colorscheme')
require('lsp')
require('treesitter')

vim.o.autoindent = true
vim.o.expandtab = true
vim.o.formatoptions = "crqlj"
--vim.o.guioptions = 'act'
vim.o.mouse = "av"
vim.o.mousemodel = "extend"
vim.o.wrap = false
vim.o.number = true
vim.o.ruler = true
vim.o.cursorline = true
vim.o.scrolloff = 6
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.wildchar = ('\t'):byte()
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest'
vim.o.listchars = 'tab:→\\ ,trail:␣,nbsp:␣,extends:❯,precedes:❮'
vim.o.backup = false

-- Set up swap and undo directories
local swapdir = '~/.local/share/nvim/swap'
local undodir = '~/.local/share/nvim/undo'

if not pcall(function ()
    local Path = require('plenary.path')
    local swappath = Path:new(Path:new(swapdir):expand())
    if not swappath:is_dir() then
        swappath:mkdir({parents = true})
    end
    local undopath = Path:new(Path:new(undodir):expand())
    if not undopath:is_dir() then
        undopath:mkdir({parents = true})
    end
    vim.o.dir = swappath:expand()
    vim.o.undodir = undopath:expand()
    vim.o.undofile = true
end) then
    print('Plenary not installed. You must set up swap and undo directories manually.')
end



--Shamelessly stolen from scrooloose's vimrc
--statusline setup
vim.o.statusline = "%#identifier#" ..
                   "[%f]" ..    --tail of the filename
                   "%*" ..

--display a warning if fileformat isnt unix
                   "%#warningmsg#" ..
                   "%{&ff!='unix'?'['.&ff.']':''}" ..
                   "%*" ..

--display a warning if file encoding isnt utf-8
                   "%#warningmsg#" ..
                   "%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}" ..
                   "%*" ..

                   "%h" ..      --help file flag
                   "%y" ..      --filetype

--read only flag
                   "%#identifier#" ..
                   "%r" ..
                   "%*" ..

--modified flag
                   "%#warningmsg#" ..
                   "%m" ..
                   "%*" ..

--display a warning if &paste is set
                   "%#error#" ..
                   "%{&paste?'[paste]':''}" ..
                   "%*" ..

                   "%=" ..      --left/right separator
                   "%c," ..     --cursor column
                   "%l/%L" ..   --cursor line/total lines
                   " %P"      --percent through file

-- Set up relative line numbering in visual mode
vim.keymap.set('n', 'v', 'v:<C-u>set rnu<CR>gv', { silent = true })
vim.keymap.set('n', 'V', 'V:<C-u>set rnu<CR>gv', { silent = true })
vim.keymap.set('n', '<C-v>', '<C-v>:<C-u>set rnu<CR>gv', { silent = true })
vim.keymap.set('v', '<Esc>', '<Esc>:set nornu nu<CR>')
vim.keymap.set('v', 'y', 'y:set nornu nu<CR>')
vim.keymap.set('v', 'p', 'p:set nornu nu<CR>')
vim.keymap.set('v', 'd', 'd:set nornu nu<CR>')

vim.keymap.set('n', '<Esc><Esc>', ':nohl<CR>', { silent = true })
vim.keymap.set({'n', 'i', 'v'}, 'Q', '<Nop>')  -- When has this ever been useful?
