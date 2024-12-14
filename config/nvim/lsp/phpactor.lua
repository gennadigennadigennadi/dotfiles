vim.lsp.config.phpactor = {
    default_config = {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_markers = { "composer.json" },
    },
}

vim.lsp.enable("phpactor")
