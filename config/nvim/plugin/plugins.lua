-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use 'projekt0n/github-nvim-theme'
    use 'sainnhe/sonokai'
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/edge'

    -- fancy vim bootscreen
    use { 
        'mhinz/vim-startify', 
        config = function() require('plugin/startify-config').setup() end
    } 

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use 'simeji/winresizer' -- <c-w> + hjkl for resizing
    -- use 'norcalli/nvim-colorizer.lua'

    use {'jez/vim-superman', opt = true, cmd = 'SuperMan'} -- manpage pager
    use 'b3nj5m1n/kommentary'

    -- the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
    -- use 'tpope/vim-repeat'

    -- surrounding text objects with paranthesis, quotes, html tags...[],(), {}, <> Auto Sourrinding mapping,
    -- Try *cs"'* (change surrounding " -> ')
    use 'tpope/vim-surround'

    use 'machakann/vim-swap' -- g<, g>, gs

    -- add new text object (can delete between comma with di, for example)
    -- or *cin)* (change in next braces)
    -- use 'wellle/targets.vim'
    -- use 'lambdalisue/suda.vim' -- Write file with sudo

    use {'windwp/nvim-autopairs', config = require('nvim-autopairs').setup()}

    use {
        'akinsho/nvim-toggleterm.lua',
        config = function() require"toggleterm".setup() end 
    }

    use 'christoomey/vim-tmux-navigator' -- tmux like pane switching ctrl + hjkl

    -- <leader>oo
    use {
        'liuchengxu/vista.vim',
        opt = true,
        cmd = 'Vista',
        config = function() require 'plugin/vista-config' end
    }

    -- editorconfig for vim
    use {
        'editorconfig/editorconfig-vim',
        config = function() require 'plugin/editor-config' end
    }

    use {
        'karb94/neoscroll.nvim',
        config = function() require('neoscroll').setup({
            -- All these keys will be mapped. Pass an empty table ({}) for no mappings
            -- mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>'},
            hide_cursor = true,          -- Hide cursor while crolling
            stop_eof = false,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true  -- The cursor will keep on scrolling even if the window cannot scroll further
        }) end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require 'plugin/nvim-tree-config' end
    }

    use 'airblade/vim-rooter' -- changes the directory to surrounding .git/root
    use 'google/vim-searchindex' -- displays found matches count
    use {'romainl/vim-cool'} -- disables search highlighting when you are done searching and re-enables it when you search again

    use {
        'nvim-telescope/telescope-fzf-native.nvim', 
        run = 'make',
        config = function() require 'telescope'.load_extension('fzf') end
    }

    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function() require "telescope".load_extension("frecency") end,
        requires = {"tami5/sqlite.lua"}
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim'} 
    }

    use {
        'vim-test/vim-test',
        config = function()
            vim.g["test#strategy"] = "neovim"
            vim.g["test#enabled_runners"] = {"php#phpunit"}
            vim.g["test#php#phpunit#executable"] = 'bin/phpunit'
        end,
        cmd = {'TestFile', 'TestLast', 'TestSuite', 'TestVisit', 'TestNearest'},
        ft = {'php'}
    }

    -- use {'sheerun/vim-polyglot'} -- A collection of language packs for Vim

    -- Git History Browser
    use {
        'junegunn/gv.vim',
        opt = true,
        cmd = 'GV'
    }

    use {'tpope/vim-fugitive'}  

    use {
        'lewis6991/gitsigns.nvim', 
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup({
            signs = {
                add = {text = "+"},
                change = {text = "~"},
                changedelete = {text = "="}
            }
        }) end
    }

    -- Debugger
    use {
        'puremourning/vimspector', 
        config = function() require('plugin/vim-spector-config').setup() end,
        ft = {'php'}
    }
    -- Install nvim-cmp, and buffer source as a dependency
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        }
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        config = function() require 'plugin/cmp-config'.setup() end
    }

    use { "rafamadriz/friendly-snippets", module = { "luasnip" } }
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use { 'neovim/nvim-lspconfig' }
    use {
        'onsails/lspkind-nvim' ,
    }

    use {'glepnir/lspsaga.nvim'}
--[[ use {
'phpactor/phpactor', 
ft = 'php', 
run = 'composer install --no-dev -o',
config = function() require('plugin/phpactor-config').setup() end
    } ]]

    use {
        'nvim-treesitter/nvim-treesitter', 
        config = function() require 'plugin/treesitter-config' end,
        run = ':TSUpdate'
    }
end)

