local lsp_installer = require "nvim-lsp-installer"
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
    local map = vim.api.nvim_buf_set_keymap
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

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

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
    require("lsp_signature").on_attach() -- Note: add in lsp client on-attach
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
    server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

require "config.lsp.null-ls"
require "config.lsp.config"
