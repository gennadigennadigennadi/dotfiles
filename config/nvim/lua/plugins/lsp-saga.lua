return {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    cmd = "Lspsaga",
    -- keys = {
    --     { '<leader>tt', "<cmd>Lspsaga term_toggle<CR>", desc = 'lspsaga terminal', mode = { 'n', 't' } }
    -- },
    config = function()
        require("lspsaga").setup({
            lightbulb = {
                enable = true,
                enable_in_insert = true,
                sign = false,
                sign_priority = 40,
                virtual_text = true,
            },
        })
    end,
}
