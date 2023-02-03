return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-project.nvim",
    },
    config = function()
        require("telescope").setup {
            defaults = { layout_config = { horizontal = { width = 0.95, height = 0.95, preview_width = 0.5 } } },
            pickers = {
                buffers = { mappings = { i = { ["<c-d>"] = "delete_buffer" } } },
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
                },
            },
        }

        require("telescope").load_extension "fzf"
        require("telescope").load_extension "projects"
    end
}
