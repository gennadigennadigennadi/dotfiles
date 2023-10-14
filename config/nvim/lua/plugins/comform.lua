return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
        formatters_by_ft = {
            ["lua"] = { "stylua" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
