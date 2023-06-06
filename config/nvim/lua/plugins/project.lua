return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			patterns = { ".git", "stylua.toml" },
		})
	end,
}
