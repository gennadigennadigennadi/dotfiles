-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

vim.opt.tabstop = 4 -- when indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4 -- On pressing tab, insert 4 spaces
vim.g.deprecation_warnings = false -- Disable deprecation warnings
vim.opt.listchars = { tab = "▸ ", space = "·", trail = "·" }

-- LSP Server to use for PHP.
-- Set to "intelephense" to use intelephense instead of phpactor.
-- vim.g.lazyvim_php_lsp = "intelephense"
