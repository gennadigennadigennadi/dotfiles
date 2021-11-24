local lsp_installer = require "nvim-lsp-installer"
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
    local mapb = vim.api.nvim_buf_set_keymap
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }
    mapb(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    mapb(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
    mapb(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    mapb(bufnr, "n", "gi", "<cmd>TroubleToggle lsp_implementations<CR>", opts)
    mapb(bufnr, "n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    mapb(bufnr, "n", "<leader>ca", "<cmd>CodeActionMenu<CR>", opts)
    mapb(bufnr, "n", "<leader>rn", "<cmd>lua require(\"renamer\").rename()<cr>", opts)
    mapb(bufnr, "v", "<leader>rn", "<cmd>lua require(\"renamer\").rename()<cr>", opts)
    -- mapb(bufnr, "n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)
    -- mapb(bufnr, "n", "gd", "<cmd>TroubleToggle lsp_definitions<CR>", opts)
    -- mapb(bufnr, "n", "<leader>ca", "<cmd>lua require(\"lspsaga.codeaction\").code_action()<CR>", opts)
    -- mapb(bufnr, "n", "<leader>ca", "<cmd>lua require(\"lspsaga.codeaction\").code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    -- mapb(bufnr, "v", "<leader>ca", ":<C-U>lua require(\"lspsaga.codeaction\").range_code_action()<CR>", opts)
    -- mapb(bufnr, "n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            "augroup lsp_document_highlight autocmd! * <buffer> autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references() augroup END",
            false
        )
    end
    require("lsp_signature").on_attach() -- Note: add in lsp client on-attach
end

local null_ls = require "null-ls"

null_ls.config {
    sources = {
        null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.stylua,
    },
}

require("lspconfig")["null-ls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        source = "always",
        -- prefix = "●", -- Could be '●', '▎', 'x'
    },
})
local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lsp_installer.on_server_ready(function(server)
    local default_opts = { on_attach = on_attach, capabilities = capabilities }

    -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
    local server_opts = {
        intelephense = function()
            local opts = require "config.lsp.intelephense"

            opts.capabilities = capabilities
            opts.on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false

                on_attach(client, bufnr)
            end

            return opts
        end,
        sumneko_lua = function()
            local opts = require("lua-dev").setup()

            opts.on_attach = on_attach
            opts.capabilities = capabilities

            return opts
        end,
    }
    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
