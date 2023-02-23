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
end

return M
