return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = { "Neotree" },
    enabled = false,
    keys = {
        { "<c-n>", "<cmd>Neotree reveal toggle<Cr>", desc = "Neotree Reveal Toggle" },
    },
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}
