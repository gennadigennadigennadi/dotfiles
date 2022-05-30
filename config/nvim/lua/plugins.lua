-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
local packer = require "packer"

return packer.startup {
    function(use)
        use { "wbthomason/packer.nvim", opt = true }
        use { "nvim-lua/plenary.nvim" }

        use { "projekt0n/github-nvim-theme" }
        use { "sainnhe/sonokai" }
        use { "sainnhe/everforest" }
        use { "sainnhe/gruvbox-material" }
        use { "rmehri01/onenord.nvim" }

        -- fancy vim bootscreen
        use {
            "goolord/alpha-nvim",
            config = function()
                require "config.alpha"
            end,
        }

        use { "simeji/winresizer" }

        use {
            "windwp/windline.nvim",
            config = function()
                require "wlsample.evil_line"
            end,
        }

        use { "rcarriga/nvim-notify" }

        use { "folke/lua-dev.nvim" }
        use { "jez/vim-superman", opt = true, cmd = "SuperMan" }
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        }

        use {
            "folke/which-key.nvim",
            config = function()
                require "config.which-key"
            end,
        }
        use "yamatsum/nvim-cursorline"
        use { "akinsho/toggleterm.nvim" }

        use { "christoomey/vim-tmux-navigator" }
        use { "editorconfig/editorconfig-vim" }
        use {
            "karb94/neoscroll.nvim",
            config = function()
                require "config.scroll"
            end,
        }

        use { "kyazdani42/nvim-web-devicons" }
        use {
            "kyazdani42/nvim-tree.lua",
            config = function()
                require "config.tree"
            end,
            -- cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        }
        -- changes the directory to surrounding .git/root
        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup {}
            end,
        }
        use { "google/vim-searchindex" }
        use { "romainl/vim-cool" }
        -- fixes the delay for 'j j/ j k'
        use {
            "max397574/better-escape.nvim",
            config = function()
                require("better_escape").setup()
            end,
        }

        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require "config.telescope"
            end,
        }
        use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        use {
            "nvim-telescope/telescope-dap.nvim",
            config = function()
                require "config.dap"
            end,
        }

        use {
            "rcarriga/vim-ultest",
            requires = { "vim-test/vim-test" },
            run = ":UpdateRemotePlugins",
            config = function()
                vim.g["test#strategy"] = "neovim"
                vim.g["test#enabled_runners"] = { "php#phpunit" }
                vim.g["test#php#phpunit#executable"] = "vendor/bin/phpunit"
                vim.g.ultest_virtual_text = true
            end,
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "config.gitsigns"
            end,
        }

        -- Debugger
        use {
            "mfussenegger/nvim-dap",
            requires = {
                "theHamsta/nvim-dap-virtual-text",
                "rcarriga/nvim-dap-ui",
            },
        }

        -- Install nvim-cmp, and buffer source as a dependency
        use { "williamboman/nvim-lsp-installer" }
        use {
            "hrsh7th/nvim-cmp",
            -- event = 'InsertEnter',
            wants = { "LuaSnip" },
            config = function()
                require "config.cmp"
            end,
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    config = function()
                        require "config.snippets"
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
                require "config.null-ls"
            end,
        }
        use {
            "neovim/nvim-lspconfig",
            config = function()
                require "config.lsp"
            end,
        }
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-path", after = "nvim-cmp" }
        use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
        use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
        use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }
        use { "ray-x/lsp_signature.nvim" }
        use { "onsails/lspkind-nvim", before = "nvim-cmp" }

        use {
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup()
            end,
            cmd = { "Trouble", "TroubleToggle" },
        }

        use {
            -- this is a working fork
            "tami5/lspsaga.nvim",
            config = function()
                require("lspsaga").init_lsp_saga { code_action_keys = { quit = "<ESC>", exec = "<CR>" } }
            end,
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require "config.treesitter"
            end,
        }
    end,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
}
