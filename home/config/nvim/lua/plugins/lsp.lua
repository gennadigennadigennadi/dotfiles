return {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    cmd = "Mason",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "folke/neodev.nvim",
        "b0o/schemastore.nvim",
    },
    config = function()
        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })

        require("mason").setup()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        local servers = {
            phpactor = {
                init_options = {
                    ["language_server_worse_reflection.inlay_hints.enable"] = true,
                    ["language_server_worse_reflection.inlay_hints.params"] = true,
                    ["language_server_worse_reflection.inlay_hints.types"] = true,
                },
            },
            dockerls = {},
            docker_compose_language_service = {},
            nil_ls = {},
            gopls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            yamlls = {
                settings = {
                    yaml = {
                        schemaStore = {
                            -- You must disable built-in schemaStore support if you want to use
                            -- this plugin and its advanced options like `ignore`.
                            enable = false,
                            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            },
            jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            },
        }

        -- require("lspconfig")["docker_compose_language_service"].setup({})

        local function on_attach(client, bufnr)
            if client.supports_method("textDocument/inlayHint") then
                -- vim.lsp.inlay_hint.enable(bufnr, true)
                vim.lsp.inlay_hint.enable(true)
            end
            local map = vim.api.nvim_buf_set_keymap
            local opts = { noremap = true, silent = true }

            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
            map(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
            -- map(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
            -- map(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
            vim.keymap.set("n", "gr", ":Lspsaga finder ref<cr>", opts)
            vim.keymap.set("n", "gi", ":Lspsaga finder imp<cr>", opts)
            vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<cr>", opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", opts)
            vim.keymap.set({ "n" }, "<leader>cm", function()
                require("phpactor").rpc("context_menu", {})
            end, opts)
            vim.keymap.set({ "n" }, "K", ":Lspsaga hover_doc<cr>", opts)
        end

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                })
            end,
        })

        local signs = {
            Error = " ",
            Warn = " ",
            Info = " ",
            Hint = " ",
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
    end,
}
