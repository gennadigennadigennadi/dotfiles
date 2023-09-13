return {
    "projekt0n/github-nvim-theme",
    event = "VimEnter",
    config = function()
        require("github-theme").setup({})
        vim.cmd("colorscheme github_light")
    end,
}
