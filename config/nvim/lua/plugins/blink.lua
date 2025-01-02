return {
    "saghen/blink.cmp",
    version = "v0.*",
    event = "VeryLazy",
    opts = {
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<ESC>"] = { "hide", "fallback" },
            ["<C-y>"] = { "select_and_accept" },
            ["<C-e>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "dadbod" },
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
        },
    },
}
