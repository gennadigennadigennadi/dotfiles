return {
    "mfussenegger/nvim-dap",
    ft = { "php" },
    keys = {
        { "<F7>", function() require("dap").step_into() end, desc = "Step Into" },
        { "<F8>", function() require("dap").step_over() end, desc = "Step Over" },
        { "<F9>", function() require("dap").step_out() end, desc = "Step Back" },
        { "<F5>", function() require("dap").continue() end, desc = "Continue" },
        { "<F4>", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    },
    dependencies = {
        "rcarriga/nvim-dap-ui",
        {
            "Weissle/persistent-breakpoints.nvim",
            config = function()
                require("persistent-breakpoints").setup({
                    load_breakpoints_event = { "BufReadPost" },
                })
            end,
        },
    },
}
