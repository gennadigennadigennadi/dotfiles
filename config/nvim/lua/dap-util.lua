local M = {}
local dap = require 'dap'

function M.reload_continue()
    package.loaded['dap_config'] = nil
    require('dap_config')
    dap.continue()
end

local opts = {noremap = false, silent = true}

-- <Leader>ec to continue
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ec', '<cmd>lua require"dap".continue()<CR>', opts)

-- <Leader>eC to reload and then continue
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>eC', '<cmd>lua require"dap_setup".reload_continue()<CR>', opts)

return M
