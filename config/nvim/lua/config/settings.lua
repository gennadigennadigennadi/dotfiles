vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.title = true -- show file title in terminal tab
vim.opt.termguicolors = true
vim.opt.splitright = true -- Opens vertical split right of current window
vim.opt.splitbelow = true -- Opens horizontal split below current window

vim.opt.pumheight = 30 -- number Items in pum
vim.o.completeopt = "menuone,noselect"
-- vim.opt.completeopt = "menu,preview,noinsert,menuone,noselect"
vim.opt.autowrite = true -- write file with focus lost
-- default is on for neovim
-- vim.opt.hidden = true -- keep vim.opts open

vim.opt.whichwrap = "h,l,,<,>,~,[,]" -- allow motions and back-spacing over line-endings

vim.opt.tabstop = 4 -- when indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4 -- On pressing tab, insert 4 spaces

vim.opt.autoindent = true
vim.opt.smartindent = true -- show existing tab with 4 spaces width
vim.opt.expandtab = true -- when at 3 spaces, and I hit > ... go to 4, not 7
vim.opt.shiftround = true

vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true -- ...except if we input a capital letter

vim.opt.scrolloff = 5
vim.opt.sidescroll = 5
vim.opt.sidescrolloff = 10

vim.opt.cmdheight = 0
vim.opt.laststatus = 3

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true -- Keep undo history across sessions, by storing in file

vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.showmode = false -- don't show current mode
vim.opt.shortmess = vim.o.shortmess .. "c" --  Don't pass messages to |ins-completion-menu|
vim.opt.mouse = "a"

vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true -- show invisible chars
vim.opt.listchars = { tab = "▸ ", space = "·", trail = "·" }
vim.opt.wrap = false

vim.o.hlsearch = false
vim.wo.number = true
vim.o.breakindent = true
vim.o.updatetime = 250

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.guicursor = "n-v-c:block-MiniStatuslineModeNormal,i-ci-ve:block-MiniStatuslineModeInsert"

-- don't load the plugins below
local builtins = {
    "gzip",
    "zip",
    "zipPlugin",
    "fzf",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "matchit",
    "matchparen",
    "logiPat",
    "rrhelper",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
}

for _, plugin in ipairs(builtins) do
    vim.g["loaded_" .. plugin] = 1
end
