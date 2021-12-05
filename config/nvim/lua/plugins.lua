-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
local packer = require "packer"

return packer.startup {
    function(use)
        use { "wbthomason/packer.nvim", opt = true }
        use { "lewis6991/impatient.nvim" }
        use { "nvim-lua/plenary.nvim" }

        use { "dstein64/vim-startuptime", disable = true }

        use { "projekt0n/github-nvim-theme" }
        use { "sainnhe/sonokai" }
        use { "sainnhe/gruvbox-material" }
        use { "sainnhe/edge" }
        use { "sainnhe/everforest" }
        use { "rmehri01/onenord.nvim" }

        -- fancy vim bootscreen
        use {
            "goolord/alpha-nvim",
            config = function()
                local startify = require "alpha.themes.startify"
                startify.section.top_buttons.val = {
                    startify.button("e", "New file", ":ene <bar> startinsert <cr>"),
                    startify.button("pu", "Packer Update", ":PackerSync<cr>"),
                    startify.file_button("$MYVIMRC", "vi", "init.lua"),
                    startify.file_button("$XDG_CONFIG_HOME/nvim/lua/plugins.lua", "ep", "plugins.lua"),
                    startify.file_button("$XDG_CONFIG_HOME/nvim/lua/keymappings.lua", "ek", "keymappings.lua"),
                    startify.file_button("$XDG_CONFIG_HOME/fish/config.fish", "ef", "config.fish"),
                    startify.file_button("$XDG_CONFIG_HOME/wezterm/wezterm.lua", "ew", "wezterm.lua"),
                }
                startify.section.header.val = require "alpha.fortune"()
                startify.section.header.opts = { position = "center" }

                require("alpha").setup(startify.opts)
            end,
        }

        use {
            "windwp/windline.nvim",
            config = function()
                require "wlsample.evil_line"
            end,
            use { "simeji/winresizer" },
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
        -- use "yamatsum/nvim-cursorline"

        -- the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
        -- use { "tpope/vim-repeat" }

        -- surrounding text objects with paranthesis, quotes, html tags...[],(), {}, <> Auto Sourrinding mapping,
        -- Try *cs"'* (change surrounding " -> ')
        -- use { "tpope/vim-surround" }
        -- use { "machakann/vim-swap" }

        -- add new text object (can delete between comma with di, for example)
        -- or *cin)* (change in next braces)
        -- use { "wellle/targets.vim" }

        use {
            "akinsho/nvim-toggleterm.lua",
            config = function()
                require("toggleterm").setup { shade_terminals = false }
            end,
        }

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
            cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
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
            "filipdutescu/renamer.nvim",
            branch = "master",
            config = function()
                require("renamer").setup()
            end,
        }

        use {
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu",
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
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup()
            end,
            cmd = { "Trouble", "TroubleToggle" },
        }
        use { "jose-elias-alvarez/null-ls.nvim" }
        use {
            "hrsh7th/nvim-cmp",
            -- event = 'InsertEnter',
            wants = { "LuaSnip" },
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    -- event = 'BufReadPre',
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

        use { "hrsh7th/cmp-path", after = "nvim-cmp" }
        use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
        use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }
        use { "ray-x/lsp_signature.nvim" }
        use { "neovim/nvim-lspconfig" }
        use { "onsails/lspkind-nvim", before = "nvim-cmp" }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require "config.treesitter"
            end,
        }
    end,
    config = {
        compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
        display = {
            open_fn = require("packer.util").float,
        },
    },
}
