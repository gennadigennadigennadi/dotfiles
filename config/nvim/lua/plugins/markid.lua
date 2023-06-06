return {
	"David-Kunz/markid",
	event = "BufReadPre",
	config = function()
		local m = require("markid")
		m.queries = {
			default = "(identifier) @markid",
			php = [[
                (variable_name) @markid
                (member_access_expression) @markid
            ]],
		}

		require("nvim-treesitter.configs").setup({
			markid = {
				enable = true,
				colors = m.colors.dark,
				queries = m.queries,
			},
		})
	end,
}
