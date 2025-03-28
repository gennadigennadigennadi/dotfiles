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
        },
        sections = {
            lualine_x = { "copilot", "encoding", "fileformat", "filetype" }, -- I added copilot here
        },
    },
}
