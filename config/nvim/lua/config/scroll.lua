require('neoscroll').setup({
    -- All these keys will be mapped. Pass an empty table ({}) for no mappings
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' },
    hide_cursor = false, -- Hide cursor while crolling
    stop_eof = false, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
})