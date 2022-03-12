local null_ls = require "null-ls"
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

null_ls.setup {
    capabilities = capabilities,
    on_attach = function() end,
    sources = {
        null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.stylua,
    },
}