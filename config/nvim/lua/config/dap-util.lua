local dap = require 'dap'
dap.adapters.php = { type = 'executable', command = 'node', args = { '/Volumes/development/open-source/vscode-php-debug/out/phpDebug.js' } }
dap.configurations.php = { { type = 'php', request = 'launch', name = 'Listen for Xdebug', port = 9003, stopOnEntry = false } }

vim.g.dap_virtual_text = true

require('dap.ext.vscode').load_launchjs()

vim.api.nvim_exec([[ au FileType dap-repl lua require('dap.ext.autocompl').attach() ]], false)

dap.defaults.fallback.exception_breakpoints = { '' }

