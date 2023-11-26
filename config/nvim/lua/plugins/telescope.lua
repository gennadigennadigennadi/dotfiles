return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find Symbols" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Oldfiles" },
        { "<leader>fb", "<cmd>Telescope buffers theme=dropdown<cr>", desc = "Find buffers" },
    },
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")

        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        width = 0.95,
                        height = 0.95,
                        preview_width = 0.5,
                    },
                },
                mappings = {
                    i = { ["<c-t>"] = trouble.open_with_trouble },
                    n = { ["<c-t>"] = trouble.open_with_trouble },
                },
            },
            pickers = {
                buffers = { mappings = { i = { ["<c-d>"] = "delete_buffer" } } },
                find_files = {
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--no-ignore-vcs",
                        "--glob",
                        "!.git/*"
                    },
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
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
    end,
}
