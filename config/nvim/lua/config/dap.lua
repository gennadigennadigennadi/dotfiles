local dap = require "dap"
local dapui = require "dapui"

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { "/Volumes/development/open-source/vscode-php-debug/out/phpDebug.js" },
}

--[[ dap.configurations.php = {
    { type = "php", request = "launch", name = "Listen for Xdebug", port = 9003, stopOnEntry = false },
} ]]

require("dap.ext.vscode").load_launchjs()

vim.notify = require "notify"

dap.listeners.after.event_initialized["dapui_config"] = function(data)
    vim.notify.notify({ data.config.name }, "info", { title = "DAP - initialized" })
end
dap.listeners.before.event_stopped["dapui_config"] = function()
    dapui.open()
end
dapui.setup {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<1-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            { id = "stacks", size = 0.5 },
            { id = "scopes", size = 0.5 },
            -- { id = "breakpoints", size = 0.2 },
            -- { id = "watches", size = -01.25 },
        },
        size = 9,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    windows = { indent = 0 },
}
