call plug#begin(stdpath('data') . '/plugged')

Plug 'cormacrelf/vim-colors-github'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'

Plug 'mhinz/vim-startify' " fancy vim bootscreen
Plug 'itchyny/lightline.vim' " simple powerline tool

Plug 'jez/vim-superman' " manpage pager
 
Plug 'tpope/vim-commentary' " gcc

Plug 'tpope/vim-repeat' " the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
Plug 'tpope/vim-surround' " surrounding text objects with paranthesis, quotes, html tags...[],(), {}, <> Auto Sourrinding mapping, Try cs\"'
Plug 'tpope/vim-abolish' " easily search, substitute, abbreviate multiple version of words, coercion to camel case / snake case / dote case / title case...
Plug 'machakann/vim-swap' " g<, g>, gs
Plug 'wellle/targets.vim' " add new text object (can delete between comma with di, for example)
Plug 'jiangmiao/auto-pairs' " makes vim autocomplete (), [], {}, '', \"\", etc

Plug 'lambdalisue/suda.vim' " Write file with sudo

" Plug 'tpope/vim-dispatch' " maybe i do need it for dispatch unittest
" Plug 'janko/vim-test' " quick test execution

Plug 'christoomey/vim-tmux-navigator' " tmux like pane switching ctrl + hjkl
Plug 'liuchengxu/vista.vim' "<leader>oo

Plug 'psliwka/vim-smoothie' "has problems with nerdtree ans smooth scrolling
Plug 'simeji/winresizer'
" Plug 'blueyed/vim-diminactive' " Plug to dim colors of not-focused windows
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']} | Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-rooter' " changes the directory to surrounding .git/root 
Plug 'moll/vim-bbye' " Close the current buffer :Bdelete and :Bwipeout (remove buffer from jumplist)

Plug 'google/vim-searchindex'  "displays found matches count
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake' " Asynchronous linting for every languages

Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'junegunn/gv.vim' " Git History Browser
Plug 'tpope/vim-fugitive'  
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim' " GBrowse for gitlab

" Plug 'joonty/vdebug'
" Plug 'mfussenegger/nvim-dap'
Plug 'puremourning/vimspector'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} " <leader> + pcf
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto completion

call plug#end()      

let g:fugitive_gitlab_domains = ['https://repo.dmknet.de/']

luafile ~/.config/nvim/lua/plugin/treesitter-config.lua
