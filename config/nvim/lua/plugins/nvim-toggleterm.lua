return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup()
        require("config.lazygit")
    end,
    cmd = { "ToggleTerm" },
    keys = {
        {
            "<c-g>",
            function()
                Lazygit_toggle()
            end,
            desc = "lazygit",
            mode = { "n", "t" },
        },
        {
            "<c-t>",
            function()
                vim.cmd("ToggleTerm<cr>")
            end,
            desc = "toggleterm",
            mode = { "n", "t" },
        },
    },
}
