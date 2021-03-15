-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use {'cormacrelf/vim-colors-github' }
  use {'gruvbox-community/gruvbox'}
  use {'joshdick/onedark.vim'}
  use {'sainnhe/sonokai'}
  use {'sainnhe/gruvbox-material'}
  use {'sainnhe/edge'}

  use { 'mhinz/vim-startify' , config = function() require('plugin/startify-config').setup() end} -- fancy vim bootscreen
  use {'itchyny/lightline.vim'} -- simple powerline tool
  use {'simeji/winresizer'} -- <c-w> + hjkl for resizing

  use {'jez/vim-superman'} -- manpage pager

  use {'tpope/vim-commentary'} -- gcc

  use {'tpope/vim-repeat'} -- the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
  use {'tpope/vim-surround'} -- surrounding text objects with paranthesis, quotes, html tags...[],(), {}, <> Auto Sourrinding mapping, Try cs\"'
  use {'tpope/vim-abolish'} -- easily search, substitute, abbreviate multiple version of words, coercion to camel case / snake case / dote case / title case...
  use {'machakann/vim-swap'} -- g<, g>, gs
  use {'wellle/targets.vim'} -- add new text object (can delete between comma with di, for example)
  use {'jiangmiao/auto-pairs'} -- makes vim autocomplete (), [], {}, '', \"\", etc
  use {'lambdalisue/suda.vim'} -- Write file with sudo

  use {'christoomey/vim-tmux-navigator'} -- tmux like pane switching ctrl + hjkl
  use {'liuchengxu/vista.vim'} -- <leader>oo
  use {'editorconfig/editorconfig-vim', config = function() require 'plugin/editor-config' end} -- editorconfig for vim
  use {'psliwka/vim-smoothie'} -- has problems with nerdtree ans smooth scrolling
  use {'kyazdani42/nvim-web-devicons'} -- for file icons
  use {'kyazdani42/nvim-tree.lua' }
  use {'airblade/vim-rooter'} -- changes the directory to surrounding .git/root 
  use {'google/vim-searchindex'} -- displays found matches count

  use {'junegunn/fzf' }
  use {'junegunn/fzf.vim'}

  use {'neomake/neomake'} -- Asynchronous linting for every languages

  use {'sheerun/vim-polyglot'} -- A collection of language packs for Vim

  use {'junegunn/gv.vim'} -- Git History Browser
  use {'tpope/vim-fugitive'}  
  use {'airblade/vim-gitgutter'}
  use {'shumphrey/fugitive-gitlab.vim'} -- GBrowse for gitlab

  use {'puremourning/vimspector'} -- Debugger

  use {'stephpy/vim-php-cs-fixer', ft = 'php'} -- <leader> + pcf
  use {'phpactor/phpactor', ft = 'php'}
  use {'neoclide/coc.nvim', branch = 'release'} -- Auto completion

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/playground' }


  -- use {'kosayoda/nvim-lightbulb'} i don't know if this one works with php
  -- Use dependency and run lua function after load
  -- use {
  --     'lewis6991/gitsigns.nvim', 
  --     requires = { 'nvim-lua/plenary.nvim'},
  --     config = function() require('gitsigns').setup() end
  -- }

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
  -- Plug 'blueyed/vim-diminactive' " Plug to dim colors of not-focused windows
  -- Plug 'lewis6991/gitsigns.nvim' -- try this
  -- Plug 'tpope/vim-dispatch' " maybe i do need it for dispatch unittest
  -- Plug 'janko/vim-test' " quick test execution
end)
