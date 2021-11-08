local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new {
    cmd = "lazygit",
    dir = "git_dir",
    size = 95,
    direction = "window",
    float_opts = {
        border = "single", -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        --[[ width = 150,
        height = 100, ]]
        highlights = { border = "Normal", background = "Normal" },
    },
    hidden = true,
    count = 4,
    -- function to run on opening the terminal
    on_open = function()
        vim.cmd "startinsert!"
    end,
}

function _lazygit_toggle()
    lazygit:toggle()
end
