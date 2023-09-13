return {
	"gbprod/phpactor.nvim",
	lazy = false,
    opts = {
      install = {
        path = vim.fn.stdpath("data") .. "/mason/phpactor",
      },
    },
	ft = "php",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
}
