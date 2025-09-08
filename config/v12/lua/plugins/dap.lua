vim.pack.add({
    "https://github.com/nvim-neotest/nvim-nio.git",
    "https://github.com/mfussenegger/nvim-dap.git",
    "https://github.com/rcarriga/nvim-dap-ui.git"
})

local dap = require("dap")

dap.adapters.php = {
    type = "executable",
    command = "php-debug-adapter",
}

require("dapui").setup()
