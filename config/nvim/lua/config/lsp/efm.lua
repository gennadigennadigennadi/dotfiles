local efm = {}

efm.settings = {
    rootMarkers = { '.git/' },
    languages = {
        lua = { { formatCommand = 'lua-format -i', formatStdin = true } },
        php = {
            { prefix = 'phpstan', lintCommand = './vendor/bin/phpstan analyze --error-format raw --no-progress' },
            {
                prefix = 'psalm',
                lintCommand = './vendor/bin/psalm --output-format=emacs --no-progress',
                lintFormats = { '%f:%l:%c:%trror - %m', '%f:%l:%c:%tarning - %m' },
            },
        },
    },
}

efm.flags = { debounce_text_changes = 150 }
efm.filetypes = { 'lua', 'php' }
efm.init_options = { documentFormatting = true }

return efm

