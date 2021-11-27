local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map("", "<Space>", "<Nop>", options) -- map the leader key

map("n", "Q", "<nop>", options)
map("n", "q", "<nop>", options) -- currently im not using macros

map("c", "w!!", "execute \":w suda://%\"", {}) -- Save files as root

-- keep visual mode after indent
map("v", ">", ">gv", options)
map("v", "<", "<gv", options)

map("n", "J", "mzJ`z", options) -- Keep the cursor in place while joining lines

map("n", "H", "^", options) -- goto the beginning of the line
map("n", "L", "g_", options) -- go to the end of the line

map("n", "Y", "y$", options) -- yank to end of line
map("v", "y", "myy`y", options) -- maintan the cursor position when yanking
map("v", "Y", "myY`y", options)

map("v", "p", "\"_dP", options) -- don't yank the text i paste stuff over

-- No yank on delete
map("v", "d", "\"_d", options)
map("n", "d", "\"_d", options)
map("n", "D", "\"_D", options)

map("i", "jj", "<esc>", options) -- Quicky escape to normal mode

-- Easy insertion of a trailing ; or , from insert mode
map("i", ";;", "<esc>A;<esc>", options)
map("i", ",,", "<esc>A,<esc>", options)

-- keep it centered
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- map('n', '<c-s>', '<C-C>:w!<CR>', options)
map("n", "<c-n>", "<cmd>NvimTreeFindFile<CR>", options)

map("t", "<esc>", [[<C-\><C-n>]], options)
map("t", "jj", [[<C-\><C-n>]], options)
map("t", "<C-h>", [[<C-\><C-n><C-W>h]], options)
map("t", "<C-j>", [[<C-\><C-n><C-W>j]], options)
map("t", "<C-k>", [[<C-\><C-n><C-W>k]], options)
map("t", "<C-l>", [[<C-\><C-n><C-W>l]], options)

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://*toggleterm#1* lua set_terminal_keymaps()"

------------------
-- DAP Debugger --
------------------
map("n", "<F5>", ":lua require'dap'.continue()<CR>", options)
map("n", "<F9>", ":lua require'dap'.run_to_cursor()<CR>", options)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", options)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", options)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", options)
-- map("n", "<leader>dj", ":lua require'dap'.down()<CR>", options)
-- map("n", "<leader>dk", ":lua require'dap'.up()<CR>", options)

map(
    "n",
    "<leader>dx",
    ":lua require'dap'.terminate()<CR>:lua require'dap'.close()<CR>:lua require('dapui').close()<CR>",
    options
)
-- map("n", "<leader>dq", ":lua require'dap'.close()<CR>:lua require('dapui').close()<CR>", options)
-- map("n", "<leader>dK", [[:lua  require('dap.ui.variables').visual_hover()<CR>]], options)
map("n", "<leader>dK", [[:lua  <Cmd>lua require("dap.ui.widgets").hover()<CR>]], options)

map("n", "<leader>de", ":lua require'dapui'.eval()<CR>", options)
map("v", "<leader>de", ":lua require'dapui'.eval()<CR>", options)
map("n", "<leader>do", ":lua require'dap'.repl.open()<CR>", options)

------------------
-- tab handling --
------------------
-- map('n', 'th', '<cmd>tabfirst<cr>', options)
map("n", "tk", "<cmd>tabprev<cr>", options)
map("n", "tj", "<cmd>tabnext<cr>", options)
map("n", "tl", "<cmd>tablast<cr>", options)
map("n", "tn", "<cmd>tabnew<cr>", options)
map("n", "tx", "<cmd>tabclose<cr>", options)
map("n", "tH", "<cmd>tabm 0<cr>", options)
map("n", "tL", "<cmd>tabm<cr>", options)

-----------
-- test ---
-----------
map("n", "t<c-f>", ":Ultest<CR>", {})
map("n", "t<c-n>", ":UltestNearest<CR>", {})
map("n", "t<c-l>", ":UltestLast<CR>", {})

map("n", "t<c-s>", ":TestSuite<CR>", {})
map("n", "t<c-v>", ":TestVisit<CR>", {})
