require('impatient')
-- require'impatient'.enable_profile()

require('packer_compiled')

require('settings')
require('plugins')
require('keymappings')

require('config.theme')
require('config.tree')
require('config.vista')
require('config.startify')
require('config.lazygit-terminal')
require('config.dap-util')
require('config.dap-ui')
require('config.neoscroll')
require('config.telescope')

require('wlsample.evil_line')
require('gitsigns').setup()
require('nvim-autopairs').setup()
require("trouble").setup()

vim.g.vista_default_executive = 'nvim_lsp'
vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }

