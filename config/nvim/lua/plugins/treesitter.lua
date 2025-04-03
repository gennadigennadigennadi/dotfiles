return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
        {
            "gbprod/php-enhanced-treesitter.nvim",
            ft = { "php" },
            enabled = false,
        },
        {
            "David-Kunz/markid",
            config = function()
                local m = require("markid")
                m.queries = {
                    default = "(identifier) @markid",
                    -- php = [[
                    -- (variable_name) @markid
                    -- (member_access_expression) @markid 
                    -- ]],
                }

                local colors = m.colors.dark

                require("nvim-treesitter.configs").setup({
                    markid = {
                        enable = true,
                        colors = colors,
                        queries = m.queries,
                    },
                })
            end,
        },
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

                "html",
                "ini",
                "json",
                "lua",
                "make",

                "markdown_inline",
                "nix",
                "php",
                "phpdoc",
                "regex",
                "scheme",
                "sql",
                "toml",
                "twig",
                "vim",
                "vimdoc",
                "yaml",
                "phpdoc",
            },
            highlight = { enable = true },
            indent = { enable = true },
            autopair = { enable = true },
        })
    end,
}
