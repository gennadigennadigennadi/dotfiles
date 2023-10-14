return {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    cmd = "Lspsaga",
    enabled = false,
    opts = {
        lightbulb = {
            enable = true,
            enable_in_insert = false,
            sign = false,
            sign_priority = 40,
            virtual_text = true,
        },
    },
}
