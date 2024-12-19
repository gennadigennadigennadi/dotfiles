return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "frappe", -- latte, frappe, macchiato, mocha
            background = light,
            -- transparent_background = true
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
