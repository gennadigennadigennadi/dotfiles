return {
    "nvim-telescope/telescope.nvim",
    cmd = { 'Telescope' },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>",                    desc = "Find files" },
        { "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find Symbols" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",                     desc = "Live grep" },
        { "<leader>fh", "<cmd>Telescope oldfiles<cr>",                      desc = "Oldfiles" },
        { "<leader>fr", "<cmd>Telescope frecency<cr>",                      desc = "Frecency" },
        { "<leader>fb", "<cmd>Telescope buffers theme=dropdown<cr>",        desc = "Find buffers" },
        { "<leader>fp", "<cmd>Telescope projects<cr>",                      desc = "Projects" },
    },
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-project.nvim",
        'nvim-telescope/telescope-frecency.nvim',
        "kkharji/sqlite.lua"
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
        require("telescope").load_extension("frecency")
    end
}
