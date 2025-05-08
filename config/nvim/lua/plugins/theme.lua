return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        lazy = false,
        enabled = false,
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "SnacksPicker", { link = "Normal" })
        end,
        config = function()
            require("onedarkpro").setup({})

            vim.o.background = "light"
            vim.cmd("colorscheme onelight")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "SnacksPicker", { link = "Normal" })
        end,
        opts = {
            background = {
                light = "latte",
                dark = "frappe",
            },
            integrations = {
                blink_cmp = true,
                diffview = true,
                lsp_saga = true,
                mason = true,
                noice = true,
                which_key = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)

            vim.o.background = "light"
            vim.cmd("colorscheme catppuccin")
        end,
    },
}
