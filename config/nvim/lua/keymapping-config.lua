local map = vim.api.nvim_set_keymap
options = {noremap = true}

-- let mapleader = " "
-- let maplocalleader = " "

-- map <space> <leader>
-- map <space> <localleader>

map('n', '<Space>', ' ', {}) -- map the leader key
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

-- keep visual mode after indent
map('v', '>', '>gv', options)
map('v', '<', '<gv', options)

