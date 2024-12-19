return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        {
            "<leader>g",
            function()
                Snacks.lazygit.open()
            end,
        },
        {
            "<leader>t",
            function()
                Snacks.term.toggle()
            end,
        },
    },
    ---@type snacks.Config
    opts = {
        lazygit = { enabled = true },
        bigfile = { enabled = true },
        scroll = { enabled = false },
        indent = { enabled = true },
        terminal = { enabled = true },
        rename = { enabled = true },
        statuscolumn = { enabled = true },
    },
}
