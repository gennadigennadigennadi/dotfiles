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
                Snacks.terminal.toggle()
            end,
        },
        {
            "<leader>q",
            function()
                Snacks.bufdelete.delete()
            end,
            desc = "Delete Buffer",
        },
    },
    opts = {
        lazygit = {
            configure = false,
            win = {
                title = "git",
                title_pos = "center",
                border = "rounded",
                backdrop = false,
            },
        },
        bigfile = { enabled = true },
        scroll = { enabled = false },
        indent = {
            animate = {
                enabled = false,
            },
        },
        terminal = { enabled = true },
        rename = { enabled = true },
        bufdelete = { enabled = true },
        dashboard = {
            pane_gap = 1,
            sections = {
                { section = "header" },
                { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { section = "startup" },
            },
        },
    },
}
