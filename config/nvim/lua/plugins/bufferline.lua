return {
    "akinsho/bufferline.nvim",
    enabled = false,
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
