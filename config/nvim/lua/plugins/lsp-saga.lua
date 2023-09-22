return {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    cmd = "Lspsaga",
    opts = {
        lightbulb = {
            enable = true,
            enable_in_insert = true,
            sign = false,
            sign_priority = 40,
            virtual_text = true,
        },
    },
}
