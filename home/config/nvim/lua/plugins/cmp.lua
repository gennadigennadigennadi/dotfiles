return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        {
            "L3MON4D3/LuaSnip",
            build = (function()
                -- Build Step is needed for regex support in snippets
                -- This step is not supported in many windows environments
                -- Remove the below condition to re-enable on windows
                if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
        },
        "saadparwaiz1/cmp_luasnip",

        "onsails/lspkind.nvim",
        "rcarriga/cmp-dap",

        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
            enabled = function()
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
            end,
            experimental = {
                ghost_text = false,
                custom_menu = true,
            },
            completion = { completeopt = "menu,menuone,noinsert" },
            formatting = {
                deprecated = true,
                format = lspkind.cmp_format({
                    with_text = true,
                    menu = {
                        buffer = "(Buffer)",
                        ["vim-dadbod-completion"] = "(DB)",
                        nvim_lsp = "(LSP)",
                        luasnip = "(LuaSnip)",
                        nvim_lua = "(Lua)",
                        path = "(path)",
                    },
                }),
            },
            --     enabled = function()
            --        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
            --    end,
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "codeium" },
                { name = "vim-dadbod-completion" },
                { name = "treesitter" },
                { name = "luasnip" },
                { name = "buffer" },
            },
        })
        cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
            sources = {
                { name = "dap" },
            },
        })

        local luasnip = require("luasnip")

        luasnip.config.set_config({
            history = true,
            -- Update more often, :h events for more info.
            updateevents = "TextChanged,TextChangedI",
        })

        require("luasnip/loaders/from_vscode").load()
    end,
}
