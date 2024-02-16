vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    ft = { "lua", "php" },
    keys = {
        {
            "<leader>F",
            function()
                require("conform").format()
            end,
            desc = "Formats file via conform",
        },
    },

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            php = { "php_cs_fixer" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = false,
        },
    },
}
