return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = { 'Neotree' },
    keys = {
        { '<leader>tn', '<cmd>NeoTreeFocusToggle<Cr>',  desc = 'NavigationToggle' },
        { '<leader>tf', '<cmd>NeoTreeRevealToggle<Cr>', desc = 'NavigationRevealToggle' },
    },
    branch = "v2.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}
