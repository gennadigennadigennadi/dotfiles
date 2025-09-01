vim.api.nvim_create_augroup("personal", { clear = true })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = { "*" },
    group = "personal",
    callback = function()
        vim.highlight.on_yank({ timeout = 700 })
    end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    group = "personal",
    callback = function()
        local ft = vim.opt_local.filetype:get()
        -- don't apply to git messages
        if ft:match("commit") or ft:match("rebase") then
            return
        end
        -- get position of last saved edit
        local markpos = vim.api.nvim_buf_get_mark(0, "\"")
        local line = markpos[1]
        local col = markpos[2]
        -- if in range, go there
        if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
            vim.api.nvim_win_set_cursor(0, { line, col })
        end
    end,
})

-- lint my files
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

-- folding methods
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})
