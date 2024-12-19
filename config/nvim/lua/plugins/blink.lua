return {
    "saghen/blink.cmp",
    version = "v0.*",
    opts = {
        keymap = {
            preset = "default",
            ["<Tab>"] = { "select_next", "snippet_forward", "show", "fallback" },
            ["<CR>"] = { "select_and_accept", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "dadbod", "path", "snippets", "buffer" },
            completion = {
                enabled_providers = { "lsp", "path", "snippets", "buffer", "dadbod" },
            },
            providers = {
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            },
        },
        completion = {
            menu = {
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                    padding = 2,
                    gap = 2,
                },
            },
            documentation = {
                auto_show = true,
            },
            ghost_text = {
                enabled = false,
            },
        },
    },
    opts_extend = { "sources.default" },
}
