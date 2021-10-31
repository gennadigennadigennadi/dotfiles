local lsp_installer = require("nvim-lsp-installer")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
            ]], false)
    end
end

lsp_installer.on_server_ready(function(server)
    local default_opts = {on_attach = on_attach, capabilities = capabilities}

    -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
    local server_opts = {
        ["efm"] = function()
            default_opts.settings = {
                rootMarkers = {".git/"},
                languages = {
                    lua = {
                        {
                            formatCommand = "lua-format -i --spaces-before-call --no-keep-simple-function-one-line --no-keep-simple-control-block-one-line --no-break-after-operator --no-break-after-operator --column-limit=150 --break-after-table-lb",
                            formatStdin = true
                        }
                    }
                },
                runtime = {
                    -- LuaJIT in the case of Neovim
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';')
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
                }
            }
            default_opts.flags = {debounce_text_changes = 150}
            default_opts.filetypes = {'lua'}
            default_opts.init_options = {documentFormatting = true}
            default_opts.on_attach = on_attach
            default_opts.capabilities = capabilities

            return default_opts
        end,
        ['intelephense'] = function()
            default_opts.settings = {
                languages = {php = {}},
                rootMarkers = {'composer.json'},
                telemetry = {enabled = false},
                completion = {fullyQualifyGlobalConstantsAndFunctions = true},
                phpdoc = {returnVoid = true}
            }
            default_opts.filetypes = {'php'}
            default_opts.on_attach = on_attach
            default_opts.capabilities = capabilities
            return default_opts
        end
    }
    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

