return {
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup({
            direction = 'float',
        })
        require("config.lazy")
    end,
    cmd = { 'ToggleTerm' },
    keys = {
        { '<leader>gg', function() Lazygit_toggle() end, desc = 'lazygit', mode = { 'n', 't' } },
        -- { '<leader>tt', function() vim.cmd('ToggleTerm<cr>') end, desc = 'toggleterm', mode = { 'n', 't' } }
    }
}
