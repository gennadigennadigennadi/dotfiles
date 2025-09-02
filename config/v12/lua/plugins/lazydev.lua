vim.pack.add({ "https://github.com/folke/lazydev.nvim" }, { load = true, confirm = false })

require("lazydev").setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
    integrations = { lspconfig = false },
})

