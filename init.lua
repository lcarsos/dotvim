vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.formatoptions = "crqlj"
--vim.o.guioptions = 'act'
vim.opt.mouse = "av"
vim.opt.mousemodel = "extend"
vim.opt.wrap = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.scrolloff = 6
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.wildchar = ('\t'):byte()
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.list = true
vim.opt.listchars = 'tab:» ,trail:␣,nbsp:␣,extends:❯,precedes:❮'
vim.opt.backup = false


require('plugins')

--require('lsp')


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
    vim.opt.dir = swappath:expand()
    vim.opt.undodir = undopath:expand()
    vim.opt.undofile = true
end) then
    print('Plenary not installed. You must set up swap and undo directories manually.')
end

vim.g.python_indent = {
    disable_pantheses_indenting=false,
    closed_paren_align_last_line=false,
    searchpair_timeout=150,
    continue='shiftwidth()',
    open_paren='shiftwidth()',
    close_paren='shiftwidth()'
}


--Shamelessly stolen from scrooloose's vimrc
--statusline setup
vim.opt.statusline = "%#identifier#" ..
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
vim.keymap.set({'n', 'v'}, 'Q', '<Nop>')  -- When has this ever been useful?
