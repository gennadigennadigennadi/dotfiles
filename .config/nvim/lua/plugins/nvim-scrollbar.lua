return {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
        require("scrollbar").setup({
            excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", 'neo-tree' },
        })
        require("scrollbar.handlers.gitsigns").setup()
    end,
}
