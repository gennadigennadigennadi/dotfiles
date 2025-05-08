return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "AndreM222/copilot-lualine" },
    event = "VeryLazy",
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = "|",
            section_separators = "",
            disabled_filetypes = {
                statusline = {
                    "snacks_picker_list",
                    "snacks_dashboard",
                    -- "snacks_terminal",
                },
            },
            globalstatus = true,
        },
        sections = {
            lualine_x = { "copilot", "encoding", "fileformat", "filetype" }, -- I added copilot here
            lualine_y = {},
            lualine_z = {},
        },
    },
}
