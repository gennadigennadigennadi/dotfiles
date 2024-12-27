vim.lsp.config.luals = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}
