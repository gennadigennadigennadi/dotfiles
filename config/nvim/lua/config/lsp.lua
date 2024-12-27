local function on_attach(client, bufnr)
    local opt = {}

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opt)

    vim.keymap.set("n", "gr", ":Lspsaga finder ref<cr>", opt)
    vim.keymap.set("n", "gi", ":Lspsaga finder imp<cr>", opt)
    vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<cr>", opt)
    vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", opt)

    vim.keymap.set({ "n" }, "<leader>cm", function()
        require("phpactor").rpc("context_menu", {})
    end, opt)

    vim.keymap.set({ "n" }, "K", ":Lspsaga hover_doc<cr>", opt)
end

vim.lsp.config("*", {
    on_attach = on_attach(),
})

vim.lsp.enable("phpactor")
vim.lsp.enable("luals")
