return {
    "echasnovski/mini.files",
    version = false,
    event = "VeryLazy",
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
}
