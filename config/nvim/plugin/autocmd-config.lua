-- its ugly and i want to change it as soon as possible: @see https://github.com/neovim/neovim/pull/12378
vim.cmd 'augroup my-stuff'
vim.cmd 'autocmd!'

vim.cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=700 } ]])
vim.cmd([[autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>]])
vim.cmd([[autocmd FileType fzf tunmap <buffer> <Esc>]])

-- set cursor to lust know position
vim.cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]])

vim.cmd('augroup END')
