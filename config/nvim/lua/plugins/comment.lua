return {
    "numToStr/Comment.nvim",
    keys = { "gc", "gcc", "gbc" },
    event = "BufReadPost",
    config = function()
        require("Comment").setup()
    end,
}
