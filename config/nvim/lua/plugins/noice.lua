return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        -- routes = {
        --     {
        --         filter = {
        --             event = "msg_show",
        --             any = {
        --                 { find = "%d+L, %d+B" },
        --                 { find = "; after #%d+" },
        --                 { find = "; before #%d+" },
        --                 { find = "%d fewer lines" },
        --                 { find = "%d more lines" },
        --             },
        --         },
        --         opts = { skip = true },
        --     },
        -- },
    },
}
