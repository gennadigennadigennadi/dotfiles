vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

return {
    "stevearc/conform.nvim",
    keys = {
        {
            "<leader>cc",
            function() require("conform").format() end,
            desc = "Formats file via conform",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            php = { "php_cs_fixer" },
            sql = { "sql_formatter" },
            mysql = { "sql_formatter" },
        },
    },
}
