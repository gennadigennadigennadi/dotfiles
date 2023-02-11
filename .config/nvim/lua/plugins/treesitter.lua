return {
    "nvim-treesitter/nvim-treesitter",
    event = 'VeryLazy',
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { 
                "bash", "c", "clojure", "css", "html", "json", "lua", "make", "markdown", "php",
                "scheme", "sql", "toml", "twig", "yaml", },
            highlight = { enable = true },
            indent = { enable = true },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
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
    end
}
