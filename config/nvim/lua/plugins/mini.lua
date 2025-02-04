return {
    {
        "echasnovski/mini.files",
        version = false,
        keys = {
            {
                "<leader>fM",
                function()
                    require("mini.files").open(vim.loop.cwd(), true)
                end,
                desc = "Open mini.files (cwd)",
            },
            {
                "<leader>fm",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Open mini.files (directory of current file)",
            },
        },
        opts = {
            windows = {
                preview = true,
                width_focus = 40,
                width_preview = 60,
            },
            content = {
                filter = function(entry)
                    return entry.name ~= ".DS_Store" and entry.name ~= ".git" and entry.name ~= ".idea"
                end,
            },
        },
    },
    {
        "echasnovski/mini.splitjoin",
        version = false,
        keys = {
            {
                "gS",
                function()
                    require("mini.splitjoin").toggle()
                end,
                desc = "Split/join arrays, argument lists, etc. from one vs. multiline and vice versa",
            },
        },
        opts = {},
    },
}
