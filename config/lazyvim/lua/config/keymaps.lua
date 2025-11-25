-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

vim.keymap.set("i", "jj", "<Esc>", options)
vim.keymap.set("i", "jk", "<Esc>", options)
vim.keymap.set("n", "gS", function() require("mini.splitjoin").toggle() end, { desc = "Split/Join toggle" })
