local M = {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "gbprod/phpactor.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = "PhpActor",
        ft = "php",
        opts = {
            install = {
                bin = vim.fn.stdpath("data") .. "/mason/packages/phpactor/phpactor.phar",
            },
            lspconfig = {
                enabled = false,
            },
        },
    },
}

local function on_attach(client, bufnr)
    local opt = {}

    vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>", opt)
    vim.keymap.set({ "n", "v" }, "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>", opt)
    vim.keymap.set("n", "<leader>vd", ":lua vim.diagnostic.open_float()<cr>", opt)

    vim.keymap.set({ "n", "v" }, "<leader>cm", function()
        require("phpactor").rpc("context_menu", {})
    end, opt)
end

vim.lsp.config("*", {
    on_attach = on_attach(),
})

-- vim.lsp.enable("phpactor")
vim.lsp.enable("intelephense")
vim.lsp.enable("luals")
vim.lsp.enable("bashls")
vim.lsp.enable("dockerls")
vim.lsp.enable("yamlls")

return M
