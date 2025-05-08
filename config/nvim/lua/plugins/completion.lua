local M = {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "gbprod/phpactor.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = "PhpActor",
        ft = "php",
        opts = {
            install = {
                bin = vim.fn.stdpath("data") .. "/mason/packages/phpactor/phpactor.phar",
            },
            lspconfig = {
                enabled = false,
            },
        },
    },
    {
        "nvimdev/lspsaga.nvim",
        cmd = "Lspsaga",
        ft = { "lua", "php" },
        config = function(opts)
            require("lspsaga").setup({
                lightbulb = {
                    enable = false,
                    debounce = 120,
                },
            })
        end,
    },
    {
        "olimorris/codecompanion.nvim",
        config = true,
        cmd = { "CodeCompanionChat" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            strategies = {
                chat = {
                    adapter = "copilot",
                },
                inline = {
                    adapter = "copilot",
                },
                agent = {
                    adapter = "copilot",
                },
            },
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "claude-3.7-sonnet",
                            },
                        },
                    })
                end,
            },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        keys = {
            {
                "<leader>aa",
                function() require("copilot.suggestion").toggle_auto_trigger() end,
                desc = "Toggle copilot",
            },
            {
                "<tab>",
                function()
                    if require("copilot.suggestion").is_visible() then
                        require("copilot.suggestion").accept()
                    else
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
                    end
                end,
                desc = "Copilot: Accept suggestion",
                mode = { "i" },
            },
            {
                "<c-n>",
                function() require("copilot.suggestion").next() end,
                desc = "Copilot: next suggestion",
                mode = { "i" },
            },
        },
        opts = {
            copilot_model = "gpt-4o-copilot",
            panel = {
                enabled = true,
                auto_refresh = true,
                layout = {
                    position = "right", -- | top | left | right | horizontal | vertical
                    ratio = 0.4,
                },
            },
            suggestion = {
                auto_trigger = true,
            },
        },
    },
}

local function on_attach(client, bufnr)
    local opt = {}

    vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<cr>", opt)
    --
    -- vim.keymap.set("n", "<leader>cr", function ()
    --     Snacks.rename.rename_file()
    -- end, opt)

    vim.keymap.set({ "n", "v" }, "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>", opt)
    vim.keymap.set("n", "<leader>vd", ":lua vim.diagnostic.open_float()<cr>", opt)

    vim.keymap.set({ "n", "v" }, "<leader>cm", function() require("phpactor").rpc("context_menu", {}) end, opt)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
    on_attach = on_attach(),
    capabilities = capabilities,
})

vim.lsp.enable({
    "phpactor",
    -- "intelephense",
    "luals",
    "bashls",
    "dockerls",
    "yamlls",
    "ts_ls",
})

return M
