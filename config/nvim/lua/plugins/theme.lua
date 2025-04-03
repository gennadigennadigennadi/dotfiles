return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        lazy = false,
        enabled = false,
        config = function()
            require("onedarkpro").setup({})

            vim.o.background = "light"
            vim.cmd("colorscheme onelight")
        end,
    },
    {
        "rmehri01/onenord.nvim",
        priority = 1000, -- Ensure it loads first
        enabled = false,
        config = function()
            vim.o.background = "dark"
            vim.cmd("colorscheme onenord")
        end,
    },
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            vim.g.sonokai_enable_italic = true
            -- vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_better_performance = 1

            vim.cmd.colorscheme("sonokai")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = false,
        priority = 1000,
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "SnacksPicker", { link = "Normal" })
        end,
        config = function()
            require("catppuccin").setup({
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
            })

            vim.o.background = "light"
            vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, "SnacksPicker", { link = "Normal" })
        end,
        -- enabled = false,
        config = function()
            require("github-theme").setup({
            })

            vim.cmd("colorscheme github_light")
        end,
    },
}
