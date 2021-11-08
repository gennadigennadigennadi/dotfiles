-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
local packer = require "packer"

return packer.startup {
    function(use)
        use { "wbthomason/packer.nvim", opt = true }
        use { "dstein64/vim-startuptime", disable = true }
        use { "lewis6991/impatient.nvim" }

        use { "projekt0n/github-nvim-theme" }
        use { "sainnhe/sonokai" }
        use { "sainnhe/gruvbox-material" }
        use { "sainnhe/edge" }
        use { "sainnhe/everforest" }
        use { "rmehri01/onenord.nvim" }

        -- fancy vim bootscreen
        use {
            "goolord/alpha-nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
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
            "nvim-lualine/lualine.nvim",
            config = function()
                require("lualine").setup()
            end,
        }

        use { "simeji/winresizer" }
        use { "folke/lua-dev.nvim" }
        use { "jez/vim-superman", opt = true, cmd = "SuperMan" }
        use { "b3nj5m1n/kommentary" }
        use {
            "folke/which-key.nvim",
            config = function()
                require "config.which-key"
            end,
        }
        -- use "yamatsum/nvim-cursorline"

        -- the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
        use { "tpope/vim-repeat" }

        -- surrounding text objects with paranthesis, quotes, html tags...[],(), {}, <> Auto Sourrinding mapping,
        -- Try *cs"'* (change surrounding " -> ')
        use { "tpope/vim-surround" }

        use { "machakann/vim-swap" }

        -- add new text object (can delete between comma with di, for example)
        -- or *cin)* (change in next braces)
        use { "wellle/targets.vim" }

        -- use { 'windwp/nvim-autopairs' }
        use {
            "akinsho/nvim-toggleterm.lua",
            config = function()
                require("toggleterm").setup { shade_terminals = false }
            end,
        }

        use { "christoomey/vim-tmux-navigator" }
        use { "liuchengxu/vista.vim" }
        use { "editorconfig/editorconfig-vim" }
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    char = "│",
                    buftype_exclude = { "terminal" },
                    filetype_exclude = { "alpha", "help", "vista_kind", "packer" },
                }
            end,
        }
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
        use "nathom/filetype.nvim"
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
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("renamer").setup()
            end,
        }
        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require "config.telescope"
            end,
            requires = { "nvim-lua/plenary.nvim" },
        }
        use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        use {
            "nvim-telescope/telescope-dap.nvim",
            config = function()
                require "config.dap-ui"
                require "config.dap-util"
            end,
        }
        use { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } }

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

        -- use {'tpope/vim-fugitive'}

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "config.gitsigns"
            end,
            requires = { "nvim-lua/plenary.nvim" },
        }

        -- Debugger
        use { "Pocco81/DAPInstall.nvim" }
        use { "mfussenegger/nvim-dap" }
        use { "rcarriga/nvim-dap-ui" }
        use { "theHamsta/nvim-dap-virtual-text" }

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
            config = function() end,
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
                "rafamadriz/friendly-snippets",
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
        use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }
        -- Autocompletion plugin
        use { "ray-x/lsp_signature.nvim" }
        use { "neovim/nvim-lspconfig" }

        use { "onsails/lspkind-nvim", before = "nvim-cmp" }

        use {
            -- this is a working fork
            "tami5/lspsaga.nvim",
            config = function()
                require("lspsaga").init_lsp_saga { code_action_keys = { quit = "<ESC>", exec = "<CR>" } }
            end,
        }

        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
        use { "nvim-treesitter/playground" }
    end,
    config = { compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua" },
}
