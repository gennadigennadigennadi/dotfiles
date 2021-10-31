require('settings')
require('plugins')
require('keymappings')

require('theme-config')
require('tree-config')
require('vista-config')
require('startify-config')
require('editor-config')
require('lazygit-terminal-config')

vim.g.vista_default_executive = 'nvim_lsp'
vim.g.EditorConfig_exclude_patterns = {'fugitive://.*'}

require('dap-util')
require('dap-ui-config')

require('neoscroll-config')

require('wlsample.evil_line')
require('gitsigns').setup()
require('nvim-autopairs').setup()
-- your configuration comes here
require("trouble").setup {}
require('telescope').setup({
    defaults = {layout_config = {horizontal = {width = 0.95, height = 0.95, preview_width = 0.5}}},
    pickers = {buffers = {mappings = {i = {["<c-d>"] = "delete_buffer"}}}}
})
require('telescope').load_extension('fzf')
require("telescope").load_extension("frecency")
require('telescope').load_extension('dap')
