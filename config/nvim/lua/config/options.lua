vim.opt.title = true -- show file title in terminal tab
vim.opt.splitright = true -- Opens vertical split right of current window
vim.opt.splitbelow = true -- Opens horizontal split below current window

vim.o.completeopt = "menuone,noselect"
vim.opt.autowrite = true -- write file with focus lost

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
-- vim.opt.relativenumber = true
-- vim.opt.list = true -- show invisible chars
vim.opt.listchars = { tab = "▸ ", space = "·", trail = "·" }
vim.opt.wrap = false

vim.o.hlsearch = false
vim.wo.number = true
vim.o.breakindent = true
vim.o.updatetime = 250

vim.o.foldcolumn = "1"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
-- vim.o.foldtext = "v:lua.vim.lsp.foldtext()"

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.guicursor = "n-v-c:block-MiniStatuslineModeNormal,i-ci-ve:block-MiniStatuslineModeInsert"
vim.o.guicursor = "n-c:block-lualine_a_normal,v:block-lualine_a_visual,i-ci-ve:block-lualine_a_insert"

vim.diagnostic.config({
    virtual_text = true,
    underline = false,
    update_in_insert = false,
    -- virtual_lines = {
    --     current_line = false,
    -- },
    virtual_lines = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "󰞏",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})

vim.g.no_php_maps = true
