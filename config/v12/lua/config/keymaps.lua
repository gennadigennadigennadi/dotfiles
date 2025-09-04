local options = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>fe", function() MiniFiles.open() end)
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end)
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end)
vim.keymap.set("n", '<leader>gf', function() Snacks.lazygit.log_file() end)
vim.keymap.set("n", 'gd', function() Snacks.picker.lsp_definitions() end)
vim.keymap.set("n", 'gi', function() Snacks.picker.lsp_implementations() end)
vim.keymap.set("n", 'gr', function() Snacks.picker.lsp_references() end)

vim.keymap.set("i", "jj", "<Esc>", options)
vim.keymap.set("i", "jk", "<Esc>", options)

vim.keymap.set({ "n", "v", "i" }, "<c-s>", "<esc>:write!<cr>", options)

-- keep it centered
vim.keymap.set("n", "n", "nzzzv", options)
vim.keymap.set("n", "N", "Nzzzv", options)

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
