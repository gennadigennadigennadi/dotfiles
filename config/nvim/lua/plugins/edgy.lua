return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
        animate = {
            enabled = false,
        },
        left = {
            {
                title = "Neo-Tree",
                open = "Neotree reveal",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                end,
                size = { height = 0.5, width = 0.225 },
            },
            { ft = "dapui_scopes", title = "Scopes" },
            { ft = "dapui_breakpoints", title = "Breakpoints" },
            { ft = "dapui_stacks", title = "Stacks" },
        },
        right = {
            {
                ft = "Outline",
                pinned = true,
                open = "SymbolsOutline",
            },
            "dapui_scopes",
        },
        bottom = {
            {
                ft = "toggleterm",
                ping = true,
                size = { height = 0.3, width = 0.9 },
                -- exclude floating windows
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
            "Trouble",
            { ft = "dapui_watches", title = "Watches" },
            { ft = "dap-repl", title = "Debug REPL" },
            { ft = "dapui_console", title = "Debug Console" },
        },
    },
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
}
