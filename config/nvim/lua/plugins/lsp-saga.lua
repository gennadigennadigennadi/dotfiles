return {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    ft = { "lua", "php" },
    config = function(opts)
        require("lspsaga").setup({
            lightbulb = {
                enable = false,
                debounce = 120,
            },
            -- ui = {
            --     kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
            -- },
        })
    end,
}
