local M = {}
local map = vim.api.nvim_set_keymap

function M.setup()
    options = {noremap = true}

    vim.g.vimspector_enable_mappings = 'HUMAN'
    
    map('n', '<leader>di', '<Plug>VimspectorBalloonEval', options)
    map('x', '<leader>di', '<Plug>VimspectorBalloonEval', options)
end

return M
