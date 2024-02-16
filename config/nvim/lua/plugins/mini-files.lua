return {
    "echasnovski/mini.files",
    version = false,
    keys = {
        {
            "<leader>fm",
            function()
                require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
            end,
            desc = "Open mini.files (directory of current file)",
        },
        {
            "<leader>fM",
            function()
                require("mini.files").open(vim.loop.cwd(), true)
            end,
            desc = "Open mini.files (cwd)",
        },
    },
    opts = {
        windows = {
            preview = true,
            width_focus = 40,
            width_preview = 60,
        },
        options = {
            use_as_default_explorer = true,
        },
    },
}
