return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		require("noice").setup({})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
