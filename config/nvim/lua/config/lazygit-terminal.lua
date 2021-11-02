local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
    cmd = 'lazygit',
    dir = 'git_dir',
    direction = 'float',
    float_opts = { border = 'single' },
    hidden = true,
    count = 4,
    -- function to run on opening the terminal
    on_open = function()
        vim.cmd('startinsert!')
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end


vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
