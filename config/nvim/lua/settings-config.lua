vim.opt.timeoutlen = 200 -- timeoutlen for e.g leader key
vim.opt.ttimeoutlen = 0

vim.opt.title = true -- show file title in terminal tab
vim.opt.termguicolors = true
vim.opt.splitright = true -- Opens vertical split right of current window
vim.opt.splitbelow = true -- Opens horizontal split below current window

vim.opt.pumheight = 20 -- number Items in pum
vim.opt.completeopt = 'menu,preview,noinsert,menuone,noselect'
vim.opt.autowrite = true -- write file with focus lost
vim.opt.hidden = true -- keep vim.opts open

vim.opt.whichwrap = 'h,l,,<,>,~,[,]' -- allow motions and back-spacing over line-endings

vim.opt.tabstop = 4 -- when indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4  -- On pressing tab, insert 4 spaces
vim.opt.tabstop = 4 -- when indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4  -- On pressing tab, insert 4 spaces

vim.opt.autoindent = true
vim.opt.smartindent  = true -- show existing tab with 4 spaces width
vim.opt.expandtab = true -- when at 3 spaces, and I hit > ... go to 4, not 7
vim.opt.shiftround = true

vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true --...except if we input a capital letter

vim.opt.scrolloff = 10
vim.opt.sidescroll = 10
vim.opt.sidescrolloff = 10

vim.opt.cmdheight = 2
vim.opt.updatetime = 500 -- time vim waits before writing swap file/ also used for CursorHold

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.showmode = false -- don't show current mode 
vim.opt.shortmess = vim.o.shortmess .. 'c' --  Don't pass messages to |ins-completion-menu|
vim.opt.mouse = 'a'

vim.opt.cursorline = true -- Highlight current line
vim.opt.signcolumn = 'yes:2' -- combine signcolumn with number
vim.opt.number = true -- show current linenumber
vim.opt.relativenumber = true
vim.opt.list = false -- show invisible chars
vim.opt.wrap = false -- don't wrap lines 

vim.opt.foldenable = false -- Don't fold by default
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldnestmax = 3 

vim.opt.swapfile = false
vim.opt.undofile = true -- Keep undo history across sessions, by storing in file

