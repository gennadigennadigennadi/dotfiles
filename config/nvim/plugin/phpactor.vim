" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>pn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>gd :call phpactor#GotoDefinition()<CR> " this own is not the one from the lsp!!!
nmap <Leader>gv :call phpactor#GotoDefinition('vsplit')<CR>
nmap <Leader>gh :call phpactor#GotoDefinition('hsplit')<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>pt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>pc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

