return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = false,
    keys = {
        {
            "<leader>qS",
            function() require("persistence").select() end,
            desc = "Restore Session",
        },
    },
    opts = {},
}
