require("dapui").setup {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        -- repl = "r",
    },
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            { id = "stacks", size = 0.5 },
            { id = "scopes", size = 0.5 },
            -- { id = "breakpoints", size = 0.25 },
            -- { id = "watches", size = 00.25 },
        },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = {},
    },
    windows = { indent = 1 },
}
