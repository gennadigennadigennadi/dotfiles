return {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
        require("scrollbar").setup()
        require("scrollbar.handlers.gitsigns").setup()
    end
}
