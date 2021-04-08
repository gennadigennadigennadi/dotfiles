function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--layout=reverse','--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}

    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" always use Rg for every keypress instead of only using for the initial search request
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

