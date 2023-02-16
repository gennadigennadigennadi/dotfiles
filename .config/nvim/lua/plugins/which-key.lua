local M = {
    "folke/which-key.nvim",
    event = "BufReadPost",
}

function M.config()
    local wk = require "which-key"

    wk.setup {
        plugins = {
            spelling = {
                enabled = true
            }
        }
    }

    wk.register({
        q = { "<cmd>bp<bar>bd #<CR>", "close buffer" },
        x = { "<cmd>q!<cr>", "Exit" },
        s = { "<cmd>w!<cr>", "Save" },
        Q = { "<cmd>wqa!<cr>", "Write and quit" },
        h = { name = "+gitsign",
            b = "blame",
            s = "stage hunk"
        },
        r = {
            name = "+reload",
            r = { "<cmd>source $MYVIMRC<cr>", "Reload init.lua" },
            l = { "<cmd>source %<cr>", "Reload current file" },
        },
    }, {
        prefix = "<leader>",
    })
end

return M
