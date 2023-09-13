return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
            experimental = { ghost_text = false, custom_menu = true },
            completion = { completeopt = "menu,menuone,noinsert" },
            formatting = {
                deprecated = true,
                format = lspkind.cmp_format({
                    with_text = true,
                    menu = {
                        buffer = "(Buffer)",
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
            -- documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
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
                { name = "treesitter" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
            },
        })
        cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
            sources = {
                { name = "dap" },
            },
        })

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        -- cmp.setup.cmdline("/", {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = {
        --         { name = "buffer" },
        --     },
        -- })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        -- cmp.setup.cmdline(":", {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = cmp.config.sources({
        --         { name = "path" },
        --     }, {
        --         { name = "cmdline" },
        --     }),
        -- })

        local luasnip = require("luasnip")

        luasnip.config.set_config({
            history = true,
            -- Update more often, :h events for more info.
            updateevents = "TextChanged,TextChangedI",
        })

        require("luasnip/loaders/from_vscode").load()
    end,
}
