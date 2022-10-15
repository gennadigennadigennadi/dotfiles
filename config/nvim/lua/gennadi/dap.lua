local dap = require "dap"
local dapui = require "dapui"

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath "cache" .. "/dapinstall/php/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
    { type = "php", request = "launch", name = "Listen for Xdebug", port = 9003, stopOnEntry = false },
}

-- require("dap.ext.vscode").load_launchjs()
require("nvim-dap-virtual-text").setup({
    enabled = true
})

vim.notify = require "notify"

dap.listeners.after.event_initialized["dapui_config"] = function(data)
    -- vim.notify.notify({ data.config.name }, "info", { title = "DAP - initialized" })
    dapui.open {}
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close {}
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close {}
end


dapui.setup {
    icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<1-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    windows = { indent = 0 },
}
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "blue", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "red", linehl = "QuickFixLine", numhl = "" })
