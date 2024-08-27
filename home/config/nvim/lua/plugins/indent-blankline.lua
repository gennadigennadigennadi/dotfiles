return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
        indent = {
            char = "▏",
        },
        scope = { enabled = false },
        exclude = {
            filetypes = {
                "help",
                "lazy",
                "mason",
                "notify",
                "oil",
            },
        },
    },
}
