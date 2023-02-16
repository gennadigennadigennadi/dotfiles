return {
    "nvim-treesitter/nvim-treesitter",
    event = 'VeryLazy',
    config = function()
        require("nvim-treesitter.configs").setup {
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
