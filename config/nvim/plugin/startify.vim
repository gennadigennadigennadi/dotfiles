
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ ]

let g:startify_bookmarks = [
            \ {'vi': '$MYVIMRC'},
            \ {'df': '$HOME/workspace/dotfiles'},
            \ {'P': '/Volumes/development'},
            \]

let g:startify_commands = [
            \ {'du': ['start docker', '!docker-compose up -d']},
            \]
