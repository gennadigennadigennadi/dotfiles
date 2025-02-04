return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        {
            "<leader>gg",
            function()
                Snacks.lazygit.open()
            end,
        },
        {
            "<c-t>",
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
        {
            "<leader>fe",
            function()
                Snacks.picker.explorer()
            end,
            desc = "explorer",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Smart Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "buffers",
        },
        {
            "<leader>fh",
            function()
                Snacks.picker.recent()
            end,
            desc = "recent",
        },
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "<leader>cR",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "Rename File",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gi",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
    },
    opts = {
        lazygit = { enabled = true },
        bigfile = { enabled = true },
        indent = {
            animate = {
            },
        },
        statuscolumn = {
            enabled = true,
            -- left = { "sign", "git" }, -- priority of signs on the left (high to low)
            -- right = { "fold", "mark" }, -- priority of signs on the right (high to low)
        },
        terminal = { enabled = true },
        rename = { enabled = true },
        bufdelete = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                files = { hidden = true },
                grep = { hidden = true },
            },
            matcher = {
                frecency = true, -- frecency bonus
            },
        },
        explorer = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        input = { enabled = true },
        notify = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 2500,
        },
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
