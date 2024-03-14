return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find Symbols" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Oldfiles" },
        { "<leader>fb", "<cmd>Telescope buffers theme=dropdown<cr>", desc = "Find buffers" },
        {
            "<leader>fa",
            function()
                require("telescope").extensions.live_grep_args.live_grep_args()
            end,
            desc = "Live grep args",
        },
    },
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
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
                    find_command = { "rg", "--files", "--sort=path" },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
                },

                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("live_grep_args")
    end,
}
