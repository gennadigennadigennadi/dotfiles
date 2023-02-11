return {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
        require("project_nvim").setup({
            patterns = { ".git", "stylua.toml" },
        })
    end
}
