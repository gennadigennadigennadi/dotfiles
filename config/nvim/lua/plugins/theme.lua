return {
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
    }
}
