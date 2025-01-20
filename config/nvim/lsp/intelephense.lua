vim.lsp.config.intelephense = {
    cmd = { "intelephense", "--stdio" },
    root_markers = { "composer.json", ".git" },
    filetypes = { "php" },
}
