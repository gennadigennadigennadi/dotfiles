local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup {
    experimental = { ghost_text = false, custom_menu = true },
    completion = { completeopt = "menu,menuone,noinsert" },
    formatting = {
        deprecated = true,
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "(Buffer)",
                nvim_lsp = "(LSP)",
                luasnip = "(LuaSnip)",
                nvim_lua = "(Lua)",
                path = "(path)",
            },
        },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
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
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
