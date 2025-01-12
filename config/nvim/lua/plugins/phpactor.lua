return {
    "gbprod/phpactor.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    cmd = "PhpActor",
    ft = "php",
    opts = {
        install = {
            bin = vim.fn.stdpath("data") .. "/mason/packages/phpactor/phpactor.phar",
        },
        lspconfig = {
            enabled = false,
        },
    },
}
