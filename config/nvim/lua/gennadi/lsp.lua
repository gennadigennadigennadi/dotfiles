local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require "lspconfig"

local function on_attach(client, bufnr)
    local map = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
    map(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    map(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    map(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
    map(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
    map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            "augroup lsp_document_highlight autocmd! * <buffer> autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references() augroup END",
            false
        )
    end

    if client.name == "sumneko_lua" or client.name == "intelephense" then
        client.server_capabilities.document_formatting = false
    end

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

lspconfig.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        languages = { php = {} },
        rootMarkers = { "composer.json" },
        telemetry = { enabled = false },
        format = { enabled = false },
        completion = { fullyQualifyGlobalConstantsAndFunctions = true },
        phpdoc = { returnVoid = true },
    },
}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.ansiblels.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        source = "always",
        prefix = "●", -- Could be '●', '▎', 'x'
    },
})
