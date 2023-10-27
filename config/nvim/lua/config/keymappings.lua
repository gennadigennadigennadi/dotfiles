local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map("", "<Space>", "<Nop>", options) -- map the leader key

vim.keymap.set({ "n", "v", "i" }, "<c-s>", "<esc>:update!<cr>", options)
vim.keymap.set("i", "jj", "<Esc>", options)
vim.keymap.set("i", "jk", "<Esc>", options)

map("n", "<leader>Q", ":wqa!<cr>", options)
map("n", "<leader>q", "<cmd>bp<bar>bd #<CR>", options)
map("n", "<leader>x", "<cmd>q!<CR>", options)

map("n", "Q", "<nop>", options)

-- keep visual mode after indent
map("v", ">", ">gv", options)
map("v", "<", "<gv", options)

map("n", "J", "mzJ`z", options) -- Keep the cursor in place while joining lines

map("n", "H", "^", options) -- goto the beginning of the line
map("n", "L", "g_", options) -- go to the end of the line

map("n", "Y", "y$", options) -- yank to end of line
map("v", "y", "myy`y", options) -- maintan the cursor position when yanking
map("v", "Y", "myY`y", options)

-- No yank on delete
map("v", "p", "\"_dP", options) -- don't yank the text i paste stuff over
-- map("v", "d", "\"_d", options)
map("n", "x", "\"_x", options)
map("n", "D", "\"_D", options)

-- Easy insertion of a trailing ; or ,
map("i", ";;", "<esc>A;<esc>", options)
map("n", ";;", "<esc>A;<esc>", options)
map("i", ",,", "<esc>A,<esc>", options)
map("n", ",,", "<esc>A,<esc>", options)

-- keep it centered
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)

map("n", "<c-d>", "<c-d>zz", options)
map("n", "<c-u>", "<c-u>zz", options)
-- Move a line
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

------------------
-- tab handling --
------------------
map("n", "th", "<cmd>tabfirst<cr>", options)
map("n", "tk", "<cmd>tabprev<cr>", options)
map("n", "tj", "<cmd>tabnext<cr>", options)
map("n", "tl", "<cmd>tablast<cr>", options)
map("n", "tn", "<cmd>tabnew<cr>", options)
map("n", "tx", "<cmd>tabclose<cr>", options)
map("n", "tH", "<cmd>tabm 0<cr>", options)
map("n", "tL", "<cmd>tabm<cr>", options)

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
