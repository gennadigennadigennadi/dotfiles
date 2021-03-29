-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use {'cormacrelf/vim-colors-github'}
  use {'sainnhe/sonokai'}
  use {'sainnhe/gruvbox-material'}
  use {'sainnhe/edge'}
  use 'rktjmp/lush.nvim'

  -- fancy vim bootscreen
  use { 
    'mhinz/vim-startify', 
    config = function() require('plugin/startify-config').setup() end
  } 

  -- use {'itchyny/lightline.vim'} -- simple powerline tool
  use {'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'plugin/statusline-config' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {'simeji/winresizer'} -- <c-w> + hjkl for resizing
  use 'norcalli/nvim-colorizer.lua'

  use {'jez/vim-superman', opt = true} -- manpage pager

  use {'tpope/vim-commentary'} -- gcc

  -- the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
  use {'tpope/vim-repeat'} 
  
  -- surrounding text objects with paranthesis, quotes, html tags...[],(), {}, <> Auto Sourrinding mapping, 
  -- Try *cs"'* (change surrounding " -> ')
  use {'tpope/vim-surround'}

  use {'machakann/vim-swap'} -- g<, g>, gs

  -- add new text object (can delete between comma with di, for example)
  -- or *cin)* (change in next braces)
  use {'wellle/targets.vim'} 

  -- use {'jiangmiao/auto-pairs'} -- makes vim autocomplete (), [], {}, '', \"\", etc
  use {'lambdalisue/suda.vim'} -- Write file with sudo

  use 'axelf4/vim-strip-trailing-whitespace'

  use {'christoomey/vim-tmux-navigator'} -- tmux like pane switching ctrl + hjkl

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
  
  use {'psliwka/vim-smoothie'}

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require 'plugin/nvim-tree-config' end
  }
  use {'airblade/vim-rooter'} -- changes the directory to surrounding .git/root 
  use {'google/vim-searchindex'} -- displays found matches count

  use {'junegunn/fzf'}
  use {'junegunn/fzf.vim'}

  use {'neomake/neomake', ft = 'php'} -- Asynchronous linting for every languages

  use {'sheerun/vim-polyglot'} -- A collection of language packs for Vim

  use {
    'junegunn/gv.vim',
    opt = true,
    cmd = 'GV'
  } -- Git History Browser

  use {'tpope/vim-fugitive'}  

  use {
    'lewis6991/gitsigns.nvim', 
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use {'shumphrey/fugitive-gitlab.vim'} -- GBrowse for gitlab

  -- Debugger
  use {
    'puremourning/vimspector', 
    config = function() require('plugin/vim-spector-config').setup() end
  }

  -- use {'stephpy/vim-php-cs-fixer', ft = 'php'} -- <leader> + pcf
  use {
    'phpactor/phpactor', 
    ft = 'php', 
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

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- You can specify multiple plugins in a single call
  -- Plug 'blueyed/vim-diminactive' " Plug to dim colors of not-focused windows
  -- Plug 'tpope/vim-dispatch' " maybe i do need it for dispatch unittest
  -- Plug 'janko/vim-test' " quick test execution
end)
