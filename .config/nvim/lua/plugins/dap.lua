return {
    "mfussenegger/nvim-dap",
    event = 'VeryLazy',
    dependencies = {
        -- does not support php, yet
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"

        dap.configurations.php = {
            { type = "php", request = "launch", name = "Listen for Xdebug", port = 9003, stopOnEntry = false },
        }

        require("dap.ext.vscode").load_launchjs()

        require("nvim-dap-virtual-text").setup {
            enabled = true,
        }

        dap.listeners.after.event_initialized["dapui_config"] = function()
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
    end
}
