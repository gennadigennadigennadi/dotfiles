local map = vim.api.nvim_set_keymap
options = {noremap = true, silent = true}

map('n', '<Space>', ' ', {}) -- map the leader key
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

map('n', 'Q', '<nop>', options)
map('n', 'q', '<nop>', {silent = true}) -- currently im not using macros

map('c', 'w!!', 'execute ":w suda://%"', {}) -- Save files as root 

-- keep visual mode after indent
map('v', '>', '>gv', options)
map('v', '<', '<gv', options)

map('n', '<esc>', ':nohlsearch<CR>', options)
map('n', 'J', 'mzJ`z', options) -- Keep the cursor in place while joining lines

map('n', '<c-s>', '<C-C>:w!<CR>', options)
map('n', '<c-q>', '<cmd>bp<bar>bd #<CR>', options)
map('n', '<c-x>', '<cmd>q!<CR>', options)
map('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', options)

map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', options)

map('n', '<leader>rr', ':luafile $MYVIMRC<CR>', {})
map('n', '<leader>rl', ':luafile %<CR>', {})
map('n', '<leader>rs', ':source %<CR>', {})

----------------
-- Find stuff --
----------------
map('n', '<leader>;', '<cmd>Buffers<CR>', options)
map('n', '<leader>ff', '<cmd>Files<CR>', options)
map('n', '<leader>fh', '<cmd>History<CR>', options)
map('n', '<leader>fr', '<cmd>Rg<CR>', options)
map('n', '<leader>oo', '<cmd>Vista!!<cr>', {})

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
