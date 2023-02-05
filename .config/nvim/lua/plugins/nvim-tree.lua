return {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeFindFile', 'NvimTreeToggle', 'NvimTreeOpen' },
    event = "BufReadPost",
    config = function()
        require("nvim-tree").setup {
            view = {
                adaptive_size = false,
                width = 30,
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 1500,
            },
            sync_root_with_cwd = true,
        }
    end,
}
