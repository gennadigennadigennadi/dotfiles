require('impatient')
-- require'impatient'.enable_profile()
require('packer_compiled')

require('settings')
require('plugins')
require('keymappings')

require('config.dap-ui')
require('config.dap-util')
require('config.lazygit-terminal')
require('config.scroll')
require('config.startify')
require('config.telescope')
require('config.theme')
require('config.tree')

require('gitsigns').setup()
require('wlsample.evil_line')
require('nvim-autopairs').setup()
require('trouble').setup()

vim.g.vista_default_executive = 'nvim_lsp'
vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }

