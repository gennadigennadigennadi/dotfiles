call plug#begin($HOME . '/.config/nvim/plugged')

" # Theme
Plug 'cormacrelf/vim-colors-github'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'

Plug 'mhinz/vim-startify' " fancy vim bootscreen
Plug 'itchyny/lightline.vim' " simple powerline tool
Plug 'blueyed/vim-diminactive' " Plug to dim colors of not-focused windows

Plug 'machakann/vim-highlightedyank' " highlights yanked lines
Plug 'tpope/vim-commentary' " gcc
Plug 'tpope/vim-repeat' " the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
" [],(), {}, <> Auto Sourrinding mapping, Try cs"'
Plug 'tpope/vim-surround' " surrounding text objects with paranthesis, quotes, html tags...
Plug 'tpope/vim-abolish' " easily search, substitute, abbreviate multiple version of words, coercion to camel case / snake case / dote case / title case...

Plug 'wellle/targets.vim' " add new text object (can delete between comma with di, for example)
Plug 'google/vim-searchindex' 

Plug 'tpope/vim-dispatch' " maybe i do need it for dispatch unittest
Plug 'janko/vim-test' " quick test execution

" Plug 'swekaj/php-foldexpr.vim'
" Plug 'rayburgemeestre/phpfolding.vim' folds whole functions only

" Navigation
Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator' " tmux like pane switching ctrl + hjkl
Plug 'liuchengxu/vista.vim'

" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips' " if i want to use the os.path stuf i do need this


" Plug 'yuttie/comfortable-motion.vim'
Plug 'psliwka/vim-smoothie'
Plug 'simeji/winresizer'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']} | Plug 'tiagofumo/vim-nerdtree-syntax-highlight' | Plug 'ryanoasis/vim-devicons'

Plug 'moll/vim-bbye' " Close the current buffer :Bdelete and :Bwipeout (remove buffer from jumplist)

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake' " Asynchronous linting for every languages

" +---------+
" | Language Highlighting |
" +---------+
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim

Plug 'junegunn/gv.vim' " Git History Browser
Plug 'tpope/vim-fugitive' | Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/kmARC/vim-fubitive.git' " Gbrowse for bitbucket

Plug 'joonty/vdebug'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} " <leader> + pcf
" Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'} " php refactoring options
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
" Auto completion
" Plug 'Shougo/neco-vim'
" Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()      

