return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
        require("ibl").setup({
            show_trailing_blankline_indent = false,
            char = "▏",
            filetype_exclude = { "mason", "dashboard" },
            show_current_context = true,
            max_indent_increase = 1,
            show_first_indent_level = false,
        })
    end,
}
