return {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    cmd = "Lspsaga",
    ft = { "lua", "php" },
    opts = {
        lightbulb = {
            enable = false,
            debounce = 120,
        },
    },
}
