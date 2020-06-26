
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1


let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ ]

let g:startify_bookmarks = [
            \ {'core': '/Volumes/Development/Projects/tickeos/core/readme.md'},
            \ {'vi': '$MYVIMRC'},
            \]

let g:startify_commands = [
            \ {'rt': ['rebuild', '!./rebuild.sh -d']},
            \ {'cc': ['clear cache', '!./clear_cache.sh']},
            \ {'cu': ['composer update', '!env COMPOSER=composer.customized.json composer update --prefer-source']},
            \ ]

            " \ {'ct': ['customize test', '!bin/customize.sh \? test dev dev']},
