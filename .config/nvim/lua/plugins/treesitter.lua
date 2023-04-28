return {
    "nvim-treesitter/nvim-treesitter",
    event = 'VeryLazy',
    dependencies = {
        'nvim-treesitter/playground',
        'gbprod/php-enhanced-treesitter.nvim'
    },
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
                "gitcommit",
                "gitignore",
                "gitignore",
                "vimdoc",
                "html",
                "ini",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "php",
                "regex",
                "scheme",
                "sql",
                "toml",
                "twig",
                "vim",
                "yaml",
                -- "phpdoc",
            },
            highlight = { enable = true },
            indent = { enable = true },
        }
    end
}
