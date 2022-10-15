require("nvim-treesitter.configs").setup {
    ensure_installed = { "php", "html", "c", "json", "lua", "clojure", "yaml" },
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
