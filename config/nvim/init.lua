require('settings')
require('plugins')
require('keymappings')

require('theme-config')
require('tree-config')
require('vista-config')
require('startify-config')
require('editor-config')
require('lazygit-terminal-config')
require('treesitter-config')
require('dap-config')
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

vim.api.nvim_command('autocmd BufWritePost ~/.config/nvim/lua/dap-config.lua :luafile %')
