vim.api.nvim_create_augroup("personal", { clear = true })

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    group = "personal",
    callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
        if ok and cl then
            vim.wo.cursorline = true
            vim.api.nvim_win_del_var(0, "auto-cursorline")
        end
    end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    group = "personal",
    callback = function()
        local cl = vim.wo.cursorline
        if cl then
            vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
            vim.wo.cursorline = false
        end
    end,
})

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

-- rename for mini.files and lrp-rename
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesActionRename",
    group = "personal",
    callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
    end,
})

-- lsp progress bar
vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(vim.lsp.status(), "info", {
            id = "lsp_progress",
            title = "LSP Progress",
            opts = function(notif)
                notif.icon = ev.data.params.value.kind == "end" and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})
