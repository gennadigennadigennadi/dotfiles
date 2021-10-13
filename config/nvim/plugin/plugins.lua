-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    use {'projekt0n/github-nvim-theme'}
    use {'sainnhe/sonokai'}
    use {'sainnhe/gruvbox-material'}
    use {'sainnhe/edge'}
    use {'sainnhe/everforest'}

    -- fancy vim bootscreen
    use { 'mhinz/vim-startify' }

    use {
        'windwp/windline.nvim',
        config = function()
            require('wlsample.evil_line')
            -- require('wlfloatline').setup()
        end
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
        config = function() require"toggleterm".setup({
            shade_terminals = false,
        }) end
    }

    use 'christoomey/vim-tmux-navigator' -- tmux like pane switching ctrl + hjkl

    -- <leader>oo
    use {
        'liuchengxu/vista.vim',
        opt = true,
        cmd = 'Vista'
    }

    -- editorconfig for vim
    use { 'editorconfig/editorconfig-vim' }

    use {
        'karb94/neoscroll.nvim',
        config = function() require('neoscroll').setup({
            -- All these keys will be mapped. Pass an empty table ({}) for no mappings
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>'},
            hide_cursor = true,          -- Hide cursor while crolling
            stop_eof = false,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true  -- The cursor will keep on scrolling even if the window cannot scroll further
        }) end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons', opt = true }
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
        "rcarriga/vim-ultest",
        requires = {"vim-test/vim-test"},
        run = ":UpdateRemotePlugins",
        config = function()
            vim.g["test#strategy"] = "neovim"
            vim.g["test#enabled_runners"] = {"php#phpunit"}
            vim.g["test#php#phpunit#executable"] = 'bin/phpunit'
            vim.g.ultest_virtual_text = true
        end,
    }

    -- use {'sheerun/vim-polyglot'} -- A collection of language packs for Vim

    use {'tpope/vim-fugitive'}

    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end }

    -- Debugger
    use {'Pocco81/DAPInstall.nvim'}
    use { 'mfussenegger/nvim-dap' }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }
    use {
        'theHamsta/nvim-dap-virtual-text',
        config = function() vim.g.dap_virtual_text = true end
    }
    -- Install nvim-cmp, and buffer source as a dependency
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        }
    }
    use { 'hrsh7th/cmp-nvim-lsp' }

    use {
        "rafamadriz/friendly-snippets",
        module = { "luasnip" }
    }

    use { 'L3MON4D3/LuaSnip' } -- Snippets plugin
    use { 'saadparwaiz1/cmp_luasnip' } -- Snippets source for nvim-cmp
    use { 'neovim/nvim-lspconfig' }

    use { 'onsails/lspkind-nvim' }

    use {
        'rinx/lspsaga.nvim',
        config = function () require('lspsaga').init_lsp_saga({ }) end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
