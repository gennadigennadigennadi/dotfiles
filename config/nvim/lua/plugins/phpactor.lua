return {
    "gbprod/phpactor.nvim",
    enabled = false,
    opts = {
        install = {
            bin = vim.fn.stdpath("data") .. "/mason/bin/phpactor",
        },
        lspconfig = {
            enabled = false,
        },
    },
    ft = "php",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    }
}
