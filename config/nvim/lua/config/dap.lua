local dap = require "dap"
local dapui = require "dapui"

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { "/Volumes/development/open-source/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
    { type = "php", request = "launch", name = "Listen for Xdebug", port = 9003, stopOnEntry = false },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("nvim-dap-virtual-text").setup()

require("dap.ext.vscode").load_launchjs()

-- vim.api.nvim_exec([[ au FileType dap-repl lua require('dap.ext.autocompl').attach() ]], false)
vim.api.nvim_exec [[
autocmd FileType dapui* set statusline=\
autocmd FileType dap-repl set statusline=\
]]
-- dap.defaults.fallback.exception_breakpoints = { "" }
