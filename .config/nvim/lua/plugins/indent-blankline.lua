return {
    "lukas-reineke/indent-blankline.nvim",
    event = 'VeryLazy',
    config = function()
        require("indent_blankline").setup({
            show_trailing_blankline_indent = false,
            char = "▏",
            filetype_exclude = { "mason" },
            show_current_context = true,
            -- show_current_context_start = true,
            max_indent_increase = 1,
            show_first_indent_level = true,
        })
    end
}
