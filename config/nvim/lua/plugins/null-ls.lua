return {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            on_attach = function() end,
            sources = {
                null_ls.builtins.diagnostics.php.with({
                    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                }),
                -- null_ls.builtins.diagnostics.phpstan.with({}),
                -- null_ls.builtins.diagnostics.psalm,
                null_ls.builtins.formatting.phpcsfixer,
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.code_actions.gitsigns,
            },
        })
    end,
}
