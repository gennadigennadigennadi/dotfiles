return {
    "mfussenegger/nvim-dap",
    lazy = false,
    -- event = "BufReadPost",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text", -- does not support php, yet
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"
        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js' }
        }

        require("dap.ext.vscode").load_launchjs()

        require("nvim-dap-virtual-text").setup {
            enabled = true,
        }

        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open {} end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close {} end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close {} end
        dap.listeners.before.disconnect["dapui_config"] = function()
            dap.repl.close()
            dapui.close()
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
    end
}
