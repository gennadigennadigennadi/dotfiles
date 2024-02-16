return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    enabled = false,
    opts = {
        indent = {
            char = "▏",
        },
        exclude = {
            filetypes = {
                "mason",
                "dashboard",
            },
        },
    },
}
