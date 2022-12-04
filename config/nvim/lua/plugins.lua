-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
local packer = require "packer"

return packer.startup {
    function(use)
        -- essentials
        use { "wbthomason/packer.nvim", opt = true }
        use { "nvim-lua/plenary.nvim" }
        use { "simeji/winresizer" }
        use { "kyazdani42/nvim-web-devicons" }
        use { "rcarriga/nvim-notify" }
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require "gennadi.treesitter"
            end,
        }
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        }
        use { "christoomey/vim-tmux-navigator" }

        -- themes
        use { "projekt0n/github-nvim-theme" }
        use { "sainnhe/sonokai" }
        use { "rmehri01/onenord.nvim" }

        -- fancy vim bootscreen
        use {
            "goolord/alpha-nvim",
            config = function()
                require "gennadi.alpha"
            end,
        }

        use {
            "nvim-lualine/lualine.nvim",
            after = "github-nvim-theme",
            config = function()
                require("lualine").setup {
                    options = {
                        theme = "auto",
                    },
                }
            end,
        }

        use { "folke/lua-dev.nvim" }

        use {
            "folke/which-key.nvim",
            config = function()
                require "gennadi.which-key"
            end,
        }
        use { "yamatsum/nvim-cursorline" }
        use {
            "akinsho/toggleterm.nvim",
            config = function()
                require("toggleterm").setup {
                    shade_terminals = false,
                }
            end,
        }

        use { "gpanders/editorconfig.nvim" }

        use {
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup {
                    -- All these keys will be mapped. Pass an empty table ({}) for no mappings
                    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
                    hide_cursor = false, -- Hide cursor while crolling
                    stop_eof = false, -- Stop at <EOF> when scrolling downwards
                    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                }
            end,
        }

        use {
            "kyazdani42/nvim-tree.lua",
            config = function()
                require "gennadi.tree"
            end,
        }
        -- changes the directory to surrounding .git/root
        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup {}
            end,
        }
        use { "romainl/vim-cool" }

        -- project search
        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require "gennadi.telescope"
            end,
        }
        use { "nvim-telescope/telescope-file-browser.nvim" }
        use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        use {
            "nvim-telescope/telescope-frecency.nvim",
            config = function()
                require("telescope").load_extension "frecency"
            end,
            requires = { "kkharji/sqlite.lua" },
        }

        -- git
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "gennadi.gitsigns"
            end,
        }

        -- Debugger
        use {
            "mfussenegger/nvim-dap",
            requires = {
                "theHamsta/nvim-dap-virtual-text",
                "rcarriga/nvim-dap-ui",
            },
            config = function()
                require "gennadi.dap"
            end,
        }

        -- Install nvim-cmp, and buffer source as a dependency
        use {
            "williamboman/mason.nvim",
            before = "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason").setup()
            end,
        }

        -- lsp
        use {
            "williamboman/mason-lspconfig",
            config = function()
                require("mason-lspconfig").setup {
                    automatic_installation = true,
                }
            end,
        }

        use {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            wants = { "LuaSnip" },
            config = function()
                require "gennadi.cmp"
            end,
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    config = function()
                        require "gennadi.snippets"
                    end,
                },
                { "rafamadriz/friendly-snippets" },
                {
                    "windwp/nvim-autopairs",
                    event = "BufReadPre",
                    config = function()
                        require("nvim-autopairs").setup()
                    end,
                },
            },
        }

        use {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require "gennadi.null-ls"
            end,
        }

        use {
            "neovim/nvim-lspconfig",
            config = function()
                require "gennadi.lsp"
            end,
        }

        -- cmp
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-path", after = "nvim-cmp" }
        use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
        use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
        use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }
        use { "rcarriga/cmp-dap", after = "nvim-cmp" }
        use { "onsails/lspkind-nvim", before = "nvim-cmp" }

        -- use {
        --     "gbprod/phpactor.nvim",
        --     run = require "phpactor.handler.update", -- To install/update phpactor when installing this plugin
        --     requires = {
        --         "nvim-lua/plenary.nvim", -- required to update phpactor
        --         "neovim/nvim-lspconfig", -- required to automaticly register lsp serveur
        --     },
        -- }
        use {
            "glepnir/lspsaga.nvim",
            config = function()
                require("lspsaga").init_lsp_saga {
                    code_action_keys = {
                        quit = "<ESC>",
                        exec = "<CR>",
                    },
                    rename_action_quit = "<ESC>",
                    code_action_lightbulb = {
                        virtual_text = false,
                    },
                }
            end,
        }
    end,
}
