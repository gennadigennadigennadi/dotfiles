vim.lsp.config.yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ['https://raw.githubusercontent.com/compose-spec/compose-spec/main/schema/compose-spec.json'] = {'compose.yaml', 'composer.override.yaml'},
            },
        },
    },
    filetypes = { "yaml", "yml" },
}
