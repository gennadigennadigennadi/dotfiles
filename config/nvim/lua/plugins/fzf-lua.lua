return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "Find files",
        },
        -- { "<leader>fs", , desc = "Find Symbols" },
        {
            "<leader>fg",
            function()
                require("fzf-lua").live_grep_native()
            end,
            desc = "Live grep",
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").oldfiles()
            end,
            desc = "Oldfiles",
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "Find buffers",
        },
    },
    opts = {
        "telescope",
    },
}
