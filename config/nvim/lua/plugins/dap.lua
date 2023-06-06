return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>dd",
			function()
				require("dap").continue()
			end,
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
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Dap DapBreakpointToggle",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug continue",
		},
		{
			"<leader>de",
			function()
				require("dapui").float_element("Repl")
			end,
			desc = "Dap Repl",
		},
		{
			"<M-k>",
			function()
				require("dapui").eval(nil, {})
			end,
			desc = "Dap Eval",
		},
	},
	ft = { "php" },
	dependencies = {
		"theHamsta/nvim-dap-virtual-text", -- does not support php, yet
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
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
				pathMappings = {
					["/var/www/html"] = "${workspaceFolder}",
					["/var/www/deptrac"] = "${workspaceFolder}",
				},
			},
		}
		require("nvim-dap-virtual-text").setup({
			enabled = true,
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			vim.keymap.set({ "n", "i" }, "<leader>k", function()
				require("dap.ui.widgets").hover()
			end)
			vim.keymap.set("n", "<F7>", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<F8>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<F9>", function()
				require("dap").step_out()
			end)

			vim.keymap.set({ "n", "i" }, "<leader>dn", function()
				require("dap").step_over()
			end)
			vim.keymap.set({ "n", "i" }, "<leader>di", function()
				require("dap").step_into()
			end)
			vim.keymap.set({ "n", "i" }, "<leader>do", function()
				require("dap").step_out()
			end)

			vim.keymap.set({ "n", "i" }, "<leader>dx", function()
				require("dap").terminate()
			end)
			dapui.open({})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.disconnect["dapui_config"] = function()
			dapui.close()
		end

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
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
			-- windows = { indent = 0 },
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.75,
						},
						{
							id = "stacks",
							size = 0.25,
						},
					},
					position = "left",
					size = 40,
				},
			},
		})
		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "blue", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "red", linehl = "QuickFixLine", numhl = "" })
	end,
}
