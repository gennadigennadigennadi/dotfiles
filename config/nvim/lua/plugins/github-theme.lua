return {
    "projekt0n/github-nvim-theme",
    lazy = false,
    config = function()
        require("github-theme").setup({
            options = {
                terminal_colors = false,
                darken = { -- Darken floating windows and sidebar-like windows
                    floats = false,
                    sidebars = {
                        enabled = false,
                        list = {}, -- Apply dark background to specific windows
                    },
                },
            },
        })
        vim.cmd("colorscheme github_dark")
    end,
}
