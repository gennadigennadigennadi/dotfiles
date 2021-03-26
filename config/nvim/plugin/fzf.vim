let g:fzf_layout = { 'window': { 'width': 0.98, 'height': 0.95 } }

let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:70%' --layout reverse --margin=1,1 --preview 'bat --color=always --theme=\"GitHub\" --style=header,grid --line-range :300 {}'"
  
command! -bang -nargs=* Rg
      \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

