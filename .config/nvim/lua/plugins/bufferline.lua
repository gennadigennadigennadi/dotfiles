return {
    'akinsho/bufferline.nvim',
    config = true,
    lazy = false,
    -- event = "VeryLazy",
    opts = function()
        return {
            options = {
                always_show_bufferline = true,
            },
        }
    end,
}
