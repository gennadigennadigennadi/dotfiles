vim.lsp.config.docker = {
    default_config = {
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
        single_file_support = true,
    },
}

vim.lsp.enable("docker")
