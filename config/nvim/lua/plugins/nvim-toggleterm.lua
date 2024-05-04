return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            shade_terminals = false,
            shell = "fish"
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://*toggleterm#99 lua set_terminal_keymaps()")
    end,
    cmd = { "ToggleTerm" },
    keys = {
        {
            "<leader>g",
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                local lazygit = Terminal:new({
                    name = "lazygit",
                    cmd = "lazygit",
                    id = 66,
                    direction = "float",
                    hidden = true,
                })
                lazygit:toggle()
            end,
            desc = "lazygit",
            mode = { "n" },
        },
        {
            "<c-t>",
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                local terminal = Terminal:new({
                    direction = "horizontal",
                    name = "terminal",
                    id = 99,
                    hidden = true,
                    shade_terminals = false,
                })

                terminal:toggle()
            end,
            mode = { "n", "t" },
            desc = "Open Toggleterm",
        },
    },
}
