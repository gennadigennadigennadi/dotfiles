return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    -- enabled = false,
    opts = {
        animate = {
            enabled = false,
        },
        wo = {
            winbar = true,
            winhighlight = "WinBar:EdgyWinBar,Normal:Normal",
        },
        close_when_all_hidden = false,
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
            -- {
            --     title = "Neo-Tree Git",
            --     ft = "neo-tree",
            --     filter = function(buf)
            --         return vim.b[buf].neo_tree_source == "git_status"
            --     end,
            --     pinned = true,
            --     open = "Neotree position=right git_status",
            -- },
            -- {
            --     title = "Neo-Tree Buffers",
            --     ft = "neo-tree",
            --     filter = function(buf)
            --         return vim.b[buf].neo_tree_source == "buffers"
            --     end,
            --     pinned = true,
            --     open = "Neotree position=top buffers",
            -- },
            {
                ft = "dapui_scopes",
                title = "Scopes",
                size = {
                    width = 0.225,
                },
            },
            { ft = "dapui_breakpoints", title = "Breakpoints" },
            { ft = "dapui_stacks", title = "Stacks" },
        },
        right = {
            {
                ft = "Outline",
                open = "SymbolsOutline",
                size = { width = 0.225 },
            },
            {
                ft = "dbui",
                size = { width = 0.225 },
            },
        },
        bottom = {
            {
                ft = "toggleterm",
                size = { height = 0.3 },
                -- exclude floating windows
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
            { ft = "spectre_panel", size = { height = 0.4 } },
            "Trouble",
            -- { ft = "dap-repl", title = "Debug REPL" },
            -- { ft = "dapui_watches", title = "Watches" },
            -- { ft = "dapui_console", title = "Debug Console" },
        },
        -- top = {
        --     {
        --         ft = "dbout",
        --         size = { height = 0.775 },
        --     },
        -- },
    },
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
}
