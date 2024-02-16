return {
    "projekt0n/github-nvim-theme",
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- enabled = false,
    config = function()
        require("github-theme").setup({
            options = {
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold",
                },
                darken = { -- Darken floating windows and sidebar-like windows
                    floats = true,
                    sidebars = {
                        enabled = false,
                        list = {}, -- Apply dark background to specific windows
                    },
                },
            },
        })

        vim.cmd("colorscheme github_light")
    end,
}
