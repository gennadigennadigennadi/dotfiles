vim.g.nvim_tree_respect_buf_cwd = 1

return require("nvim-tree").setup {
    disable_netrw = true,
    open_on_setup = false,
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = { enable = true },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
}
