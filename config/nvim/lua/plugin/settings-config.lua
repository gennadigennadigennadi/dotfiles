local global = vim.o
local buffer = vim.bo
local window = vim.wo

global.title = true -- show file title in terminal tab
global.termguicolors = true
global.splitright = true -- Opens vertical split right of current window
global.splitbelow = true -- Opens horizontal split below current window

global.pumheight = 20 -- number Items in pum
global.completeopt = 'menu,preview,noinsert,menuone,noselect'
global.autowrite = true -- write file with focus lost
global.hidden = true -- keep buffers open

global.whichwrap = 'h,l,,<,>,~,[,]' -- allow motions and back-spacing over line-endings
global.tabstop = 4 -- when indenting with '>', use 4 spaces width
global.shiftwidth = 4  -- On pressing tab, insert 4 spaces
global.autoindent = true
global.smartindent  = true -- show existing tab with 4 spaces width
global.expandtab = true -- when at 3 spaces, and I hit > ... go to 4, not 7
global.shiftround = true

global.ignorecase = true -- Ignore case when searching...
global.smartcase = true --...except if we input a capital letter

global.foldenable = false -- Don't fold by default
global.scrolloff = 10
global.sidescroll = 10
global.sidescrolloff = 10

global.cmdheight = 2
global.updatetime = 500 -- time vim waits before writing swap file/ also used for CursorHold

global.backup = false
global.writebackup = false
global.clipboard = 'unnamedplus' -- Use system clipboard
global.showmode = false -- don't show current mode 
global.shortmess = vim.o.shortmess .. 'c' --  Don't pass messages to |ins-completion-menu|
global.mouse = 'a'

window.cursorline = true -- Highlight current line
window.signcolumn = 'auto' -- Always show the signcolumn, otherwise it would shift the text each time
window.number = true -- show current linenumber 
window.relativenumber = true
window.list = false -- show invisible chars
window.wrap = false -- don't wrap lines 

buffer.swapfile = false
buffer.undofile = true -- Keep undo history across sessions, by storing in file

vim.g.fugitive_gitlab_domains = { 'https://repo.dmknet.de/' }
