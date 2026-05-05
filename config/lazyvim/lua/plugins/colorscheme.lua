local hl = vim.api.nvim_set_hl
hl(0, "SnacksPicker", { link = "Normal" })

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            background = { dark = "frappe" },
        },
        priority = 1000
    },
    {
        "LazyVim/LazyVim",
        opts = { colorscheme = "catppuccin-nvim" },
    },
}
