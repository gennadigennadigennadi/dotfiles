vim.pack.add({"https://github.com/folke/snacks.nvim.git"})

require('snacks').setup({
    lazygit = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
    statuscolumn = {
        folds = {
            open = true, -- show open fold icons
            git_hl = true, -- use Git Signs hl for fold icons
        },
    },
    terminal = { enabled = true },
    rename = { enabled = true },
    bufdelete = { enabled = true },
    words = { enabled = true },
    explorer = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    indent = { enabled = true },
    picker = {
        sources = {
            files = { hidden = true },
            grep = { hidden = true },
            explorer = {
                hidden = true,
            },
        },
        matcher = {
            frecency = true, -- frecency bonus
        },
    },
    dashboard = {
        enabled = true,
        pane_gap = 1,
        sections = {
            { title = "Sessions", padding = 1 },
            { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        --     { section = "startup" },
        },
        jump = { close = false },
    },
})

