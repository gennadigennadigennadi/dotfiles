return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			float_opts = {
				-- border = "double",
				width = math.floor(vim.o.columns * 0.98),
				height = math.floor(vim.o.lines * 0.95),
			},
		})
		require("config.lazygit")
	end,
	cmd = { "ToggleTerm" },
	keys = {
		{
			"<c-g>",
			function()
				Lazygit_toggle()
			end,
			desc = "lazygit",
			mode = { "n", "t" },
		},
		{
			"<c-t>",
			function()
				vim.cmd("ToggleTerm<cr>")
			end,
			desc = "toggleterm",
			mode = { "n", "t" },
		},
	},
}
