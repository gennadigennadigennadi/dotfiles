return {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    keys = {
        { '<leader>tt', "<cmd>Lspsaga term_toggle<CR>", desc = 'lspsaga terminal', mode = { 'n', 't' } }
    },
    config = function()
        require("lspsaga").setup({})
    end,
}
