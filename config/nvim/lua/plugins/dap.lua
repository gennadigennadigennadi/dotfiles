return {
    "mfussenegger/nvim-dap",
    keys = {
        {
            "<leader>dd",
            function() require("dap").continue() end,
            desc = "Dap continue",
        },
        {
            "<leader>dx",
            function()
                require("dap").close()
                require("dapui").close()
                require("dap").terminate()
            end,
            desc = "Dap continue",
        },
        {
            "<leader>b",
            "<cmd>PBToggleBreakpoint<cr>",
            desc = "Dap DapBreakpointToggle",
        },
        {
            "<F5>",
            function() require("dap").continue() end,
            desc = "Debug continue",
        },
        {
            "<leader>de",
            function() require("dapui").float_element("Repl") end,
            desc = "Dap Repl",
        },
        {
            "<M-k>",
            function() require("dapui").eval(nil, {}) end,
            desc = "Dap Eval",
        },
    },
    ft = { "php" },
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "Weissle/persistent-breakpoints.nvim",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        require("persistent-breakpoints").setup({
            load_breakpoints_event = { "BufReadPost" },
        })

        local dap = require("dap")

        dap.adapters.php = {
            type = "executable",
            command = "php-debug-adapter",
        }

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for Xdebug",
                port = 9003,
                stopOnEntry = false,
                pathMappings = {
                    ["/var/www/html/"] = "${workspaceFolder}",
                },
                xdebugSettings = {
                    max_children = 500,
                    max_depth = 5,
                    -- max_data = 100,
                },
            },
        }

        local dapui = require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            vim.keymap.set({ "n", "i" }, "<leader>k", function() require("dap.ui.widgets").hover() end)
            vim.keymap.set("n", "<F7>", function() require("dap").step_over() end)
            vim.keymap.set("n", "<F8>", function() require("dap").step_into() end)
            vim.keymap.set("n", "<F9>", function() require("dap").step_out() end)

            vim.keymap.set({ "n" }, "<leader>dn", function() require("dap").step_over() end, { desc = "step over" })

            vim.keymap.set({ "n" }, "<leader>di", function() require("dap").step_into() end, { desc = "step in" })

            vim.keymap.set({ "n" }, "<leader>do", function() require("dap").step_out() end, { desc = "step out" })

            vim.keymap.set(
                { "n" },
                "<leader>dc",
                function() require("dap").run_to_cursor() end,
                { desc = "runt to cursor" }
            )

            vim.keymap.set(
                { "n" },
                "<leader>dx",
                function() require("dap").terminate() end,
                { desc = "kill debugging" }
            )

            dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end
        dap.listeners.before.disconnect["dapui_config"] = function() dapui.close() end

        dapui.setup({
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
            },
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.40,
                        },
                        {
                            id = "breakpoints",
                            size = 0.10,
                        },
                        {
                            id = "stacks",
                            size = 0.40,
                        },
                        -- {
                        --     id = "watches",
                        --     size = 0.25,
                        -- },
                    },
                    position = "left",
                    size = 70,
                },
                {
                    elements = {
                        -- {
                        --     id = "repl",
                        --     size = 0.5,
                        -- },
                        -- {
                        --     id = "console",
                        --     size = 0.5,
                        -- },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
        })

        local sign = vim.fn.sign_define

        sign("DapBreakpoint", { text = "●" })
        sign("DapBreakpointCondition", { text = "●" })
        sign("DapLogPoint", { text = "◆" })
        sign("DapStopped", { text = "●", texthl = "DapStopped", numhl = "DapStopped" })
    end,
}
