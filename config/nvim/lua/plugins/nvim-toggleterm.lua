return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({})

        local Terminal = require("toggleterm.terminal").Terminal
        Lazygit = Terminal:new({
            name = "lazygit",
            cmd = "lazygit",
            direction = "tab",
            hidden = true,
            -- float_opts = {
            --     height = 98,
            --     widht = 99,
            -- },
        })
    end,
    cmd = { "ToggleTerm" },
    keys = {
        {
            "<c-g>",
            function()
                Lazygit:toggle()
            end,
            desc = "lazygit",
            mode = { "n", "t" },
        },
        {
            "<c-`>",
            function()
                vim.cmd("ToggleTerm<cr>")
            end,
            desc = "toggleterm",
            mode = { "n", "t" },
        },
    },
}
