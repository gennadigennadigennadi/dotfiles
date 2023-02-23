return {
    "nvim-treesitter/nvim-treesitter",
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/playground' },
    config = function()
        require("nvim-treesitter.configs").setup {
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            },
            ensure_installed = {
                "bash",
                "c",
                "clojure",
                "css",
                "dockerfile",
                "fish",
                "gitignore",
                "gitcommit",
                "help",
                "html",
                "ini",
                "json",
                "lua",
                "make",
                "markdown",
                "php",
                "phpdoc",
                "scheme",
                "sql",
                "toml",
                "twig",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
        }
    end
}
