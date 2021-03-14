" Restore cursor position when opening file
augroup position_resotre
    autocmd!
    au BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   execute "normal! g`\"" |
            \ endif
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
    " au TextYankPost * silent! lua vim.highlight.on_yank { higroup='HighlightedyankRegion', timeout=500 }
augroup END
