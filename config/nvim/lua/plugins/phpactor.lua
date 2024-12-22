return {
    "gbprod/phpactor.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    ft = "php",
    opts = {
        install = {
            bin = vim.fn.stdpath("data") .. "/mason/bin/phpactor",
        },
        lspconfig = {
            enabled = false,
        },
    },
}
