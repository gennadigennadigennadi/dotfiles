return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        opts = {
            servers = {
                phpactor = {},
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local function on_attach(client, bufnr)
                local map = vim.api.nvim_buf_set_keymap
                local opt = { noremap = true, silent = true }

                map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
                map(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<cr>", opt)

                vim.keymap.set("n", "gr", ":Lspsaga finder ref<cr>", opt)
                vim.keymap.set("n", "gi", ":Lspsaga finder imp<cr>", opt)
                vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<cr>", opt)
                vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", opt)
                vim.keymap.set({ "n" }, "<leader>cm", function()
                    require("phpactor").rpc("context_menu", {})
                end, opt)
                vim.keymap.set({ "n" }, "K", ":Lspsaga hover_doc<cr>", opt)
            end

            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                config.on_attach = on_attach

                lspconfig[server].setup(config)
            end
        end,
    },
}
