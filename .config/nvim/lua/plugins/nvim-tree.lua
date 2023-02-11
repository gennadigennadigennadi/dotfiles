return {
    'kyazdani42/nvim-tree.lua',
    lazy = false,
    cmd = { 'NvimTreeFindFile', 'NvimTreeToggle', 'NvimTreeOpen'},
    config = function()
        require("nvim-tree").setup {
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
            view = {
                adaptive_size = false,
                width = 30,
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 1500,
            },
        }
    end,
}
