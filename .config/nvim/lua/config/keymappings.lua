local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map("", "<Space>", "<Nop>", options) -- map the leader key

map("n", "Q", "<nop>", options)
map("n", "q", "<nop>", options) -- currently im not using macros

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


-- Easy insertion of a trailing ; or , from insert mode
map("i", ";;", "<esc>A;<esc>", options)
map("i", ",,", "<esc>A,<esc>", options)

-- keep it centered
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)

map('n', '<c-d>', '<c-d>zz', options)
map('n', '<c-u>', '<c-u>zz', options)
-- Move a line
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })


map("t", "<esc>", [[<C-\><C-n>]], options)
map("t", "<C-h>", [[<C-\><C-n><C-W>h]], options)
map("t", "<C-j>", [[<C-\><C-n><C-W>j]], options)
map("t", "<C-k>", [[<C-\><C-n><C-W>k]], options)
map("t", "<C-l>", [[<C-\><C-n><C-W>l]], options)

map(
    "n",
    "<leader>dx",
    ":lua require'dap'.terminate()<CR> :lua require'dap'.close()<CR> :lua require('dapui').close()<CR>",
    options
)
-- map("n", "<leader>dq", ":lua require'dap'.close()<CR>:lua require('dapui').close()<CR>", options)
-- map("n", "<leader>dK", [[:lua  require('dap.ui.variables').visual_hover()<CR>]], options)
-- map("n", "<leader>dK", [[:lua  <Cmd>lua require("dap.ui.widgets").hover()<CR>]], options)

-- map("n", "<leader>de", ":lua require'dapui'.eval()<CR>", options)
-- map("v", "<leader>de", ":lua require'dapui'.eval()<CR>", options)
-- map("n", "<leader>do", ":lua require'dap'.repl.open()<CR>", options)

------------------
-- tab handling --
------------------
map('n', 'th', '<cmd>tabfirst<cr>', options)
map("n", "tk", "<cmd>tabprev<cr>", options)
map("n", "tj", "<cmd>tabnext<cr>", options)
map("n", "tl", "<cmd>tablast<cr>", options)
map("n", "tn", "<cmd>tabnew<cr>", options)
map("n", "tx", "<cmd>tabclose<cr>", options)
map("n", "tH", "<cmd>tabm 0<cr>", options)
map("n", "tL", "<cmd>tabm<cr>", options)
