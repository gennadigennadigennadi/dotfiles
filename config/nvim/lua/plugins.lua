-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    -- use 'cormacrelf/vim-colors-github'
    use 'sainnhe/sonokai'
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/edge'

    -- fancy vim bootscreen
    use { 
        'mhinz/vim-startify', 
        config = function() require('plugin/startify-config').setup() end
    } 

    use {'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require'plugin/statusline-config' end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use 'simeji/winresizer' -- <c-w> + hjkl for resizing
    -- use 'norcalli/nvim-colorizer.lua'

    use {'jez/vim-superman', opt=true, cmd = 'SuperMan'} -- manpage pager

    -- use 'tpope/vim-commentary' -- gcc
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
            size = 10,
            open_mapping = [[<leader>t]],
            shade_filetypes = {},
            shade_terminals = false,
            -- shading_factor = '3', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
            start_in_insert = true,
            persist_size = true,
            direction = 'horizontal'
        }) end,
        cmd = 'ToggleTerm',
        keys = {[[<leader>t]]}
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
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true  -- The cursor will keep on scrolling even if the window cannot scroll further
        }) end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require 'plugin/nvim-tree-config' end
    }
    use 'airblade/vim-rooter' -- changes the directory to surrounding .git/root
    use 'google/vim-searchindex' -- displays found matches count
    use {'romainl/vim-cool'} -- disables search highlighting when you are done searching and re-enables it when you search again

    use {'junegunn/fzf.vim', requires = 'junegunn/fzf'}

    -- currently i am only using the linter and fixer feature
    use {
        'dense-analysis/ale',
        config= function()
            vim.g.ale_linters = { php = {'php','psalm'} }
            vim.g.ale_sign_error = ''
            vim.g.ale_sign_warning = ''
            vim.g.ale_fixers = {
                all = { 'remove_trailing_lines', 'trim_whitespace' },
                php = { 'php_cs_fixer' }
            }
            vim.g.ale_fix_on_save = true
        end,
        ft = {'php'}
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

    use {'sheerun/vim-polyglot', opt = true} -- A collection of language packs for Vim

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
        -- ft = {'php'}
    }

    use {
        'phpactor/phpactor', 
        ft = 'php', 
        run = 'composer install --no-dev -o',
        config = function() require('plugin/phpactor-config').setup() end
    }

    use {'neoclide/coc.nvim', branch = 'release'} -- Auto completion

    use { 
        'nvim-treesitter/nvim-treesitter', 
        config = function() require 'plugin/treesitter-config' end,
        run = ':TSUpdate'
    }
    use {
        'nvim-treesitter/playground',
        opt = true,
        cmd = 'TSPlaygroundToggle'
    }
end)
