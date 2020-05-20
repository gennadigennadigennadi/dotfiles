call plug#begin($HOME . '/.local/share/nvim/plugged')

" # Theme
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'cormacrelf/vim-colors-github'

" Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify' " fancy vim bootscreen
Plug 'itchyny/lightline.vim' " simple powerline tool

Plug 'wakatime/vim-wakatime'
Plug 'machakann/vim-highlightedyank' " highlights yanked lines

Plug 'tpope/vim-dispatch' " maybe i do need it for dispatch unittest
Plug 'janko/vim-test' " quick test execution

" Plug 'swekaj/php-foldexpr.vim'
" Plug 'rayburgemeestre/phpfolding.vim' folds whole functions only

" Navigation
Plug 'christoomey/vim-tmux-navigator' " tmux like pane switching ctrl + hjkl
Plug 'liuchengxu/vista.vim'
 
Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']} 
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nerdtree + modifications 

" Plug 'wincent/ferret'  " Ack multi file search. Right now I do only use the
" Rg! command from fzf

Plug 'moll/vim-bbye' " Close the current buffer :Bdelete and :Bwipeout (remove buffer from jumplist)

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake' " Asynchronous linting for every languages

Plug 'tpope/vim-commentary' " gcc

" [],(), {}, <> Auto Sourrinding mapping, Try cs"'
" Plug 'tpope/vim-surround'

" +---------+
" | Language Highlighting |
" +---------+
" Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim
Plug 'StanAngeloff/php.vim'

Plug 'tpope/vim-fugitive'  
Plug 'mhinz/vim-signify' " Git Wrapper for Vim + Gutter
Plug 'https://github.com/kmARC/vim-fubitive.git' " Gbrowse for bitbucket
Plug 'junegunn/gv.vim' " Git History Browser

Plug 'joonty/vdebug'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} " <leader> + pcf
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}

" Auto completion
" Plug 'Shougo/neco-vim'
" Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()      

