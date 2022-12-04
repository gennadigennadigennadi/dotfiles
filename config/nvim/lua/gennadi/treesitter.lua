require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "c",
        "clojure",
        "css",
        "html",
        "json",
        "lua",
        "make",
        "php",
        "scheme",
        "sql",
        "toml",
        "twig",
        "yaml",
    },
    highlight = { enable = true },
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
