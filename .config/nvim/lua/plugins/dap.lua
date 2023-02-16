return {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
        { "<leader>dd", function() require('dap').continue() end,              desc = "Dap continue" },
        { "<leader>b",  function() require('dap').toggle_breakpoint() end,     desc = "Dap DapBreakpointToggle" },
        { "<leader>de", function() require('dapui').float_element('Repl') end, desc = "Dap Repl" },
        { "<M-k>",      function() require("dapui").eval() end,                desc = "Dap Eval" },
    },
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

        dap.listeners.after.event_initialized["dapui_config"] = function()
            vim.keymap.set('n', '<leader>k', function() require("dap.ui.widgets").hover() end)
            vim.keymap.set('n', '<leader>dn', function() require('dap').step_over() end)
            vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
            vim.keymap.set('n', '<leader>do', function() require('dap').step_out() end)
            vim.keymap.set('n', '<leader>dx', function() require('dap').terminate() end)
            dapui.open {}
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close {}
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close {}
        end
        dap.listeners.before.disconnect["dapui_config"] = function()
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
            controls = {
                element = "scopes",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            -- windows = { indent = 0 },
            layouts = {
                {
                    elements = { {
                        id = "scopes",
                        size = 0.75
                    }, {
                        id = "stacks",
                        size = 0.25
                    } },
                    position = "left",
                    size = 40
                },
            },
        }
        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "blue", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "red", linehl = "QuickFixLine", numhl = "" })
    end
}
