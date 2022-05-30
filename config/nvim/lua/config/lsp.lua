require("nvim-lsp-installer").setup {
    automatic_installation = true,
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
    local map = vim.api.nvim_buf_set_keymap
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    require("lsp_signature").setup()

    local opts = { noremap = true, silent = true }

    map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
    map(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    map(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    map(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
    map(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
    map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            "augroup lsp_document_highlight autocmd! * <buffer> autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references() augroup END",
            false
        )
    end

    if client.name == "sumneko_lua" or client.name == "intelephense" then
        client.resolved_capabilities.document_formatting = false
    end

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local lspconfig = require "lspconfig"
lspconfig.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        languages = { php = {} },
        rootMarkers = { "composer.json" },
        telemetry = { enabled = false },
        -- format = { enabled = false },
        completion = { fullyQualifyGlobalConstantsAndFunctions = true },
        phpdoc = { returnVoid = true },
    },
}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
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
        -- prefix = "●", -- Could be '●', '▎', 'x'
    },
})
