local map = vim.api.nvim_set_keymap

local options = {noremap = true, silent = true}

map('', '<Space>', '<Nop>', options) -- map the leader key

map('n', 'Q', '<nop>', options)
map('n', 'q', '<nop>', options) -- currently im not using macros

map('c', 'w!!', 'execute ":w suda://%"', {}) -- Save files as root

-- keep visual mode after indent
map('v', '>', '>gv', options)
map('v', '<', '<gv', options)

map('n', 'J', 'mzJ`z', options) -- Keep the cursor in place while joining lines

map('n', '<c-q>', '<cmd>bp<bar>bd #<CR>', options)
map('n', '<c-x>', '<cmd>q!<CR>', options)
map('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', options)
map('n', '<c-s>', '<C-C>:w!<CR>', options)

map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', options)
map('n', '<leader>t', '<cmd>ToggleTerm<cr>', options)
map('n', 'SS', '<cmd>Startify<CR>', options)

------------------
-- Source Files --
------------------
map('n', '<leader>rr', ':luafile $MYVIMRC<CR>', {})
map('n', '<leader>rl', ':luafile %<CR>', {})

-- map('n', '<leader>oo', '<cmd>Vista!!<cr>', options)

----------------
-- Find stuff --
----------------
-- map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', {})
map('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', options)
map('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', options)
map('v', '<leader>ca', '<cmd><C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', options)
map('n', '<leader>gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', options)

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>',options)
map('n', '<leader>fr', '<cmd>Telescope live_grep<cr>',options)
map('n', '<leader><space>', '<cmd>Telescope buffers<cr>',options)
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
map('n', 't<c-n>', ':TestNearest<CR>', {})
map('n', 't<c-f>', ':TestFile<CR>', {})
map('n', 't<c-s>', ':TestSuite<CR>', {})
map('n', 't<c-l>', ':TestLast<CR>', {})
map('n', 't<c-v>', ':TestVisit<CR>', {})
