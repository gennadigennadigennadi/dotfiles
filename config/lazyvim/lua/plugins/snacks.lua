return {
    "folke/snacks.nvim",
    opts = {
        statuscolumn = {
            folds = {
                open = true, -- show open fold icons
                git_hl = true, -- use Git Signs hl for fold icons
            },
        },
        picker = {
            sources = {
                files = { hidden = true },
                grep = { hidden = true },
                explorer = { hidden = true },
            },
            matcher = {
                frecency = true, -- frecency bonus
            },
        },
        scroll = { enabled = false },
    },
}
