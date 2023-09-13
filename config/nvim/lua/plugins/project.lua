return {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
        require("project_nvim").setup({
            patterns = { ".git", "stylua.toml" },
        })
    end,
}
