local map = vim.api.nvim_set_keymap
options = {noremap = true, silent = true}

map('n', '<Space>', ' ', {}) -- map the leader key
vim.g.mapleader = ' '

map('n', 'Q', '<nop>', options)
map('n', 'q', '<nop>', options) -- currently im not using macros

map('c', 'w!!', 'execute ":w suda://%"', {}) -- Save files as root 

-- keep visual mode after indent
map('v', '>', '>gv', options)
map('v', '<', '<gv', options)

map('n', 'J', 'mzJ`z', options) -- Keep the cursor in place while joining lines

-- Barbar includes bbye
map('n', '<c-q>', '<cmd>bp<bar>bd #<CR>', options)
map('n', '<c-x>', '<cmd>q!<CR>', options)
map('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', options)
map('n', '<c-s>', '<C-C>:w!<CR>', options)

map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', options)

------------------
-- Source Files --
------------------
map('n', '<leader>rr', ':luafile $MYVIMRC<CR>', {})
map('n', '<leader>rl', ':luafile %<CR>', {})
map('n', '<leader>rs', ':source %<CR>', {})

----------------
-- Find stuff --
----------------
map('n', '<leader>ff', '<cmd>Files<CR>', options)
map('n', '<leader>;', '<cmd>Buffers<CR>', options)
map('n', '<leader>fr', '<cmd>Rg<CR>', options)

-- map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', options)

-- map('n', '<leader>fh', '<cmd>History<CR>', options)
-- map('n', '<leader>fg', '<cmd>GitFiles<CR>', options)

map('n', '<leader>oo', '<cmd>Vista!!<cr>', {})
-------------------------------------------------   
-- Find files using Telescope command-line sugar.
------------------------------------------------- 
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>',options)
map('n', '<leader>fr', '<cmd>Telescope live_grep<cr>',options)
map('n', '<leader>;', '<cmd>Telescope buffers<cr>',options)
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
-----------------------------
-- Tab (aka Buffer) stuff ---
-----------------------------
-- map('n', 'bh', '<cmd>BufferGoto 1<CR>', {})
-- map('n', 'bk', '<cmd>BufferPrevious<CR>', {})
-- map('n', 'bj', '<cmd>BufferNext<CR>', {})
-- map('n', 'bl', '<cmd>BufferLast<CR>', {})
-- map('n', 'bx', '<cmd>BufferClose<CR>', {})
-- map('n', 'B', '<cmd>BufferPick<CR>', {})

-- map('n', '<A-<>', '<cmd>BufferMovePrevious<CR>', {})
-- map('n', '<A->>', '<cmd>BufferMoveNext<CR>', {})

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
