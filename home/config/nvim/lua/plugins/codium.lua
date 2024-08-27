return {
    "Exafunction/codeium.vim",
    enabled = false,
    event = "BufEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({})
    end,
}
