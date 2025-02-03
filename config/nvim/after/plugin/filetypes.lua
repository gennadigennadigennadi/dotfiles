vim.filetype.add({
    extension = {
        conf = "conf",
        env = "dotenv",
    },
    filename = {
        [".dockerignore"] = "gitignore",
        [".env"] = "dotenv",
        [".yamlfmt"] = "yaml",
    },
    pattern = {
        ["compose.y.?ml"] = "yaml.docker-compose",
        ["docker%-compose%.y.?ml"] = "yaml.docker-compose",
        ["%.env%.[%w_.-]+"] = "dotenv",
        ["env%.(%a+)"] = function(_path, _bufnr, ext)
            vim.print(ext)
            if vim.tbl_contains({ "local", "test", "dev", "prod" }, ext) then
                return "dotenv"
            end
        end,
    },
})

-- check ../plugins/treesitter.lua to enable ts highlighting for new filetypes
