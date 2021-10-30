local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

map('', '<Space>', '<Nop>', options) -- map the leader key

map('n', 'Q', '<nop>', options)
map('n', 'q', '<nop>', options) -- currently im not using macros

map('c', 'w!!', 'execute ":w suda://%"', {}) -- Save files as root

-- keep visual mode after indent
map('v', '>', '>gv', options)
map('v', '<', '<gv', options)

map('n', 'H', '^', options) -- goto the beginning of the line
map('n', 'L', '$', options) -- go to the end of the line

map('n', 'J', 'mzJ`z', options) -- Keep the cursor in place while joining lines

map('n', '<c-q>', '<cmd>bp<bar>bd #<CR>', options)
map('n', '<c-x>', '<cmd>q!<CR>', options)
map('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', options)
map('n', '<c-s>', '<C-C>:w!<CR>', options)

map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', options)
map('n', '<leader>t', '<cmd>ToggleTerm<cr>', options)

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#1* lua set_terminal_keymaps()')

------------------
-- DAP Debugger --
------------------
------------------
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", options)

map("n", "<F5>", ":lua require'dap'.continue()<CR>", options)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", options)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", options)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", options)
-- map("n", "<leader>dj", ":lua require'dap'.down()<CR>", options)
-- map("n", "<leader>dk", ":lua require'dap'.up()<CR>", options)

map("n", "<leader>dx", ":lua require'dap'.disconnect()<CR>:lua require'dap'.close()<CR>:lua require('dapui').close()<CR>", options)

map("n", "<leader>dq", ":lua require'dap'.close()<CR>:lua require('dapui').close()<CR>", options)
map("n", "<leader>dK", [[:lua  require('dap.ui.variables').visual_hover()<CR>]], options)
map("n", "<leader>do", ":lua require'dap'.repl.open()<CR>", options)

map("n", "<leader>D", ":lua require('dapui').toggle()<CR>", options)

map('n', 'SS', '<cmd>Startify<CR>', options)

------------------
-- Source Files --
------------------
map('n', '<leader>rr', ':luafile $MYVIMRC<CR>', {})
map('n', '<leader>rl', ':luafile %<CR>', {})

map('n', '<leader>oo', '<cmd>Vista!!<cr>', options)
map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', options)
----------------
-- Find stuff --
----------------
-- map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', {})
map('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', options)
map('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', options)
map('v', '<leader>ca', '<cmd><C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', options)

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fr', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>;', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>fo', '<cmd>Telescope frecency<cr>', options)
map('n', '<leader>fh', '<cmd>Telescope oldfiles<cr>',options)

------------------
-- tab handling --
------------------
map('n', 'th', '<cmd>tabfirst<cr>', options)
map('n', 'tk', '<cmd>tabprev<cr>', options)
map('n', 'tj', '<cmd>tabnext<cr>', options)
map('n', 'tl', '<cmd>tablast<cr>', options)
map('n', 'tn', '<cmd>tabnew<cr>', options)
map('n', 'tx', '<cmd>tabclose<cr>', options)
map('n', 'tH', '<cmd>tabm 0<cr>', options)
map('n', 'tL', '<cmd>tabm<cr>', options)

-----------
-- test ---
-----------
map('n', 't<c-f>', ':Ultest<CR>', {})
map('n', 't<c-n>', ':UltestNearest<CR>', {})
map('n', 't<c-l>', ':UltestLast<CR>', {})

map('n', 't<c-s>', ':TestSuite<CR>', {})
map('n', 't<c-v>', ':TestVisit<CR>', {})
