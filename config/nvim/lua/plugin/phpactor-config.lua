local M = {}
local map = vim.api.nvim_set_keymap

function M.setup()
    options = {noremap = true}

    map('n', '<leader>pu', ':call phpactor#UseAdd()<CR>', options) -- import use statements
    map('n', '<leader>pm', ':call phpactor#ContextMenu()<CR>', options) -- invoke the context menu
    map('n', '<leader>pn', ':call phpactor#Navigate()<CR>', options) -- invoke the context menu
    map('n', '<leader>pt', ':call phpactor#Transform()<CR> ', options) -- Show brief information about the symbol under the cursor

    -- map('n', '<leader>K', ':call phpactor#Hover()<CR>', options) -- Show brief information about the symbol under the cursor

    map('n', '<leader>gd', ':call phpactor#GotoDefinition()<CR>', options) -- this own is not the one from the lsp!!!
    map('n', '<leader>gv', ':call phpactor#GotoDefinition("vsplit")<CR>', options)
    map('n', '<leader>gh', ':call phpactor#GotoDefinition("jsplit")<CR>', options)

-- List code actions available for the current buffer
    map('n', '<leader>pa', '<Plug>(coc-codeaction)', options)
-- nmap <leader>ca  

end

return M
