" vdebug

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_features = { 'max_children': 4028 }

let g:vdebug_options['break_on_open'] = 0
let g:vdebug_options['watch_window_style'] = 'compact'
let g:vdebug_options.layout = 'horizontal'
let g:vdebug_options['port'] = 9000
" let g:vdebug_options["marker_default"] = '⬦'
" let g:vdebug_options["marker_closed_tree"] = '▸'
" let g:vdebug_options["marker_open_tree"] = '▾'
" let g:vdebug_options["sign_breakpoint"] =''
" let g:vdebug_options["sign_current"] =  ''
" let g:vdebug_options["continuous_mode"] = 1

let g:vdebug_keymap = {
            \    "run" : "<F5>",
            \    "run_to_cursor" : "<F9>",
            \    "step_over" : "<F2>",
            \    "step_into" : "<F3>",
            \    "step_out" : "<F4>",
            \    "close" : "<F6>",
            \    "detach" : "<F7>",
            \    "set_breakpoint" : "<F10>",
            \    "get_context" : "<F11>",
            \    "eval_under_cursor" : "<F12>",
            \    "eval_visual" : "<F8>",
            \}


" map the project when used in a vagrant / vm | vm path : host past
let g:vdebug_options["path_maps"] = {
            \}

