return {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    cmd = "Lspsaga",
    ft = { "lua", "php" },
    -- enabled = false,
    opts = {
        -- lightbulb = {
        --     enable = false,
        --     debounce = 120,
        -- },
    },
}
