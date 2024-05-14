return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
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
