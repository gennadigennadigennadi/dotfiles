return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first,
        enabled = false,
        opts = {
            styles = { -- For example, to apply bold and italic, use "bold,italic"
                types = "NONE", -- Style that is applied to types
                methods = "NONE", -- Style that is applied to methods
                numbers = "NONE", -- Style that is applied to numbers
                strings = "NONE", -- Style that is applied to strings
                comments = "italic", -- Style that is applied to comments
                keywords = "bold", -- Style that is applied to keywords
                constants = "NONE", -- Style that is applied to constants
                functions = "bold", -- Style that is applied to functions
                operators = "NONE", -- Style that is applied to operators
                variables = "NONE", -- Style that is applied to variables
                parameters = "NONE", -- Style that is applied to parameters
                conditionals = "NONE", -- Style that is applied to conditionals
                virtual_text = "NONE", -- Style that is applied to virtual text
            },
        },
        config = function(opts)
            require("onedarkpro").setup(opts)

            vim.cmd("colorscheme onelight")
        end,
    },
    {
        "rmehri01/onenord.nvim",
        priority = 1000,
        enabled = false,
        opts = {},
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        -- enabled = false,
        config = function(opts)
            require("catppuccin").setup({
                flavour = "latte",
                -- transparent_background = true,
                integrations = {
                    blink_cmp = true,
                    diffview = true,
                    lsp_saga = true,
                    mason = true,
                    noice = true,
                    which_key = true,
                },
            })

            vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        opts = {
            transparent = true,
            styles = {
                sidebars = "normal",
                floats = "normal", 
            } 
        },
    },
}
