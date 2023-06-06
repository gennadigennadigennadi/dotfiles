return {
	"gbprod/phpactor.nvim",
	lazy = false,
	build = function()
		require("phpactor.handler.update")()
	end,
	ft = "php",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
}
