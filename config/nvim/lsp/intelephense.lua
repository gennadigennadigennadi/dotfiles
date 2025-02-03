vim.lsp.config.intelephense = {
    cmd = { "intelephense", "--stdio" },
    root_markers = { "composer.json", ".git" },
    filetypes = { "php" },
    settings = {
        intelephense = {
            telemetry = { enabled = false },
        },
    },
}
