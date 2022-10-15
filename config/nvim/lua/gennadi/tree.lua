return require("nvim-tree").setup {
    view = {
        adaptive_size = true,
        width = 40,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    sync_root_with_cwd = true,
}
