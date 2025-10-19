vim.pack.add({
    'https://github.com/catppuccin/nvim'
})

vim.pack.add(
    { { src = "https://github.com/olimorris/onedarkpro.nvim", name = "onedarkpro" } },
    { load = true, confirm = false }
)

vim.cmd[[colorscheme catppuccin-latte]]
