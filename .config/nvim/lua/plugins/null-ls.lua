return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function ()
        local null_ls = require "null-ls"

        null_ls.setup {
  --          capabilities = capabilities,
            on_attach = function() end,
            sources = {
                null_ls.builtins.diagnostics.php,
                null_ls.builtins.diagnostics.phpstan,
                -- null_ls.builtins.diagnostics.psalm,
                -- null_ls.builtins.formatting.phpcsfixer,
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.code_actions.gitsigns,
            },
        }
    end
}
