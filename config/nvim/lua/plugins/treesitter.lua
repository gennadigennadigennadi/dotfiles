return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
        "gbprod/php-enhanced-treesitter.nvim",
        "David-Kunz/markid",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "clojure",
                "css",
                "dockerfile",
                "fish",
                "gitcommit",
                "gitignore",
                "go",
                "html",
                "ini",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "nix",
                "php",
                "regex",
                "scheme",
                "sql",
                "toml",
                "twig",
                "vim",
                "vimdoc",
                "yaml",
                -- "phpdoc",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })

        local m = require("markid")
        m.queries = {
            -- default = "(identifier) @markid",
            php = [[
                (variable_name) @markid
                (member_access_expression) @markid
            ]],
        }

        require("nvim-treesitter.configs").setup({
            markid = {
                enable = true,
                -- colors = m.colors.bright,
                -- colors = m.colors.medium,
                colors = m.colors.dark,
                queries = m.queries,
            },
        })
    end,
}
