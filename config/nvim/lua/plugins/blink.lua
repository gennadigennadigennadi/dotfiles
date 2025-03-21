return {
    "saghen/blink.cmp",
    version = "*",
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
            default = { "lsp", "path", "buffer" },
            per_filetype = {
                sql = { "dadbod" },
                lua = { "lazydev" },
            },
            providers = {
                dadbod = {
                    name = "Dadbod",
                    module = "vim_dadbod_completion.blink",
                    score_offset = 200,
                },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
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
