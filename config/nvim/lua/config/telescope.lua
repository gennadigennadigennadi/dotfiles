require('telescope').setup({
    defaults = { layout_config = { horizontal = { width = 0.95, height = 0.95, preview_width = 0.5 } } },
    pickers = { buffers = { mappings = { i = { ['<c-d>'] = 'delete_buffer' } } } },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')
require('telescope').load_extension('dap')
