return {
    "folke/neodev.nvim",
    "folke/tokyonight.nvim",
    "folke/twilight.nvim",
    "github/copilot.vim",
    "gpanders/editorconfig.nvim",
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "projekt0n/github-nvim-theme",
    "rcarriga/nvim-notify",
    "rmehri01/onenord.nvim",
    "sainnhe/sonokai",
    "simeji/winresizer",
    {
        "simrat39/symbols-outline.nvim",
        keys = {
            {
                "<leader>to", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline"
            },
        },
        config = true,
    },
    { "christoomey/vim-tmux-navigator", keys = { '<c-h>', '<c-j>', '<c-k>', '<c-l>' }, },
    { "glepnir/lspsaga.nvim", cmd = { 'Lspsaga' } },
    { "j-hui/fidget.nvim", config = true, event = 'VeryLazy' },
    { "windwp/nvim-autopairs", config = true },
}
