return {
    "nvim-lua/plenary.nvim",
    { "gpanders/editorconfig.nvim", event = "VeryLazy" },
    "folke/neodev.nvim",
    -- "folke/twilight.nvim",
    -- "github/copilot.vim",
    "kyazdani42/nvim-web-devicons",
    "projekt0n/github-nvim-theme",
    "rmehri01/onenord.nvim",
    "folke/tokyonight.nvim",
    "sainnhe/sonokai",
    "rcarriga/nvim-notify",
    "simeji/winresizer",
    {
        "simrat39/symbols-outline.nvim",
        keys = {
            { "<leader>to", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
        },
        config = true,
    },
    { "christoomey/vim-tmux-navigator", keys = { '<c-h>', '<c-j>', '<c-k>', '<c-l>' }, },
    { "j-hui/fidget.nvim", config = true, event = 'VeryLazy' },
    { "windwp/nvim-autopairs", config = true, event = 'VeryLazy' },
}
