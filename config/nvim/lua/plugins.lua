-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
local packer = require('packer')

return packer.startup({
    function(use)
        use {'wbthomason/packer.nvim', opt = true}

        use {'projekt0n/github-nvim-theme'}
        use {'sainnhe/sonokai'}
        use {'sainnhe/gruvbox-material'}
        use {'sainnhe/edge'}
        use {'sainnhe/everforest'}
        use {'sheerun/vim-polyglot'}

        -- fancy vim bootscreen
        use {'mhinz/vim-startify'}
        use {'windwp/windline.nvim'}

        use 'simeji/winresizer' -- <c-w> + hjkl for resizing
        -- use 'norcalli/nvim-colorizer.lua'

        use {'jez/vim-superman', opt = true, cmd = 'SuperMan'} -- manpage pager
        use 'b3nj5m1n/kommentary' -- gcc/gc3

        -- the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
        use 'tpope/vim-repeat'

        -- surrounding text objects with paranthesis, quotes, html tags...[],(), {}, <> Auto Sourrinding mapping,
        -- Try *cs"'* (change surrounding " -> ')
        use 'tpope/vim-surround'

        use 'machakann/vim-swap' -- g<, g>, gs

        -- add new text object (can delete between comma with di, for example)
        -- or *cin)* (change in next braces)
        use 'wellle/targets.vim'
        use 'lambdalisue/suda.vim' -- Write file with sudo

        use {'windwp/nvim-autopairs'}
        use {
            'akinsho/nvim-toggleterm.lua',
            config = function()
                require"toggleterm".setup({shade_terminals = false})
            end
        }

        use {'christoomey/vim-tmux-navigator'} -- tmux like pane switching ctrl + hjkl
        use {'liuchengxu/vista.vim'} -- <leader>oo
        use {'editorconfig/editorconfig-vim'} -- editorconfig for vim

        use {'karb94/neoscroll.nvim'}

        use {'kyazdani42/nvim-web-devicons'}
        use {'kyazdani42/nvim-tree.lua'}

        use {'airblade/vim-rooter'} -- changes the directory to surrounding .git/root
        use {'google/vim-searchindex'} -- displays found matches count
        use {'romainl/vim-cool'} -- disables search highlighting when you are done searching and re-enables it when you search again

        use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        use {"nvim-telescope/telescope-frecency.nvim", requires = {"tami5/sqlite.lua"}}

        use {
            "rcarriga/vim-ultest",
            requires = {"vim-test/vim-test"},
            run = ":UpdateRemotePlugins",
            config = function()
                vim.g["test#strategy"] = "neovim"
                vim.g["test#enabled_runners"] = {"php#phpunit"}
                vim.g["test#php#phpunit#executable"] = 'bin/phpunit'
                vim.g.ultest_virtual_text = true
            end
        }

        use {'tpope/vim-fugitive'}

        use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

        -- Debugger
        use {'Pocco81/DAPInstall.nvim'}
        use {'mfussenegger/nvim-dap'}
        use {"rcarriga/nvim-dap-ui"}
        use {
            'theHamsta/nvim-dap-virtual-text',
            config = function()
                vim.g.dap_virtual_text = true
            end
        }

        -- Install nvim-cmp, and buffer source as a dependency
        use {'williamboman/nvim-lsp-installer'}
        use {"folke/trouble.nvim"}

        -- use {"hrsh7th/nvim-cmp", requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-path"}}
        -- use {"rafamadriz/friendly-snippets", module = {"luasnip"}}
        -- use {'L3MON4D3/LuaSnip'} -- Snippets plugin

        use {
            "hrsh7th/nvim-cmp",
            -- event = "InsertEnter",
            config = function()
                require("config.cmp").config()
            end,
            wants = {"LuaSnip"},
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    -- event = "BufReadPre",
                    wants = "friendly-snippets",
                    config = function()
                        require "config.snippets"
                    end
                }, "rafamadriz/friendly-snippets", {
                    "windwp/nvim-autopairs",
                    event = "BufReadPre",
                    config = function()
                        require "config.autopairs"
                    end
                }
            }
        }
        use {"hrsh7th/cmp-path", after = "nvim-cmp"}
        use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
        use {"hrsh7th/cmp-nvim-lsp"}
        use {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"}
        -- Autocompletion plugin
        use {'ray-x/lsp_signature.nvim'}
        use {
            'neovim/nvim-lspconfig',
            config = function()
                require "config.lsp"
            end
        }

        use {'onsails/lspkind-nvim', before = "nvim-cmp"}

        use {
            'rinx/lspsaga.nvim',
            config = function()
                require('lspsaga').init_lsp_saga({code_action_keys = {quit = "<ESC>", exec = "<CR>"}})
            end
        }

        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    end,
    config = {
        -- load order seems to be a problem here
        -- compile_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'plugin', 'packer_compiled.lua')
    }
})

