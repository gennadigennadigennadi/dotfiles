vim.g.startify_change_to_dir = true
vim.g.startify_change_to_vcs_root = true
vim.g.startify_custom_header = 'startify#center(startify#fortune#cowsay())'

vim.g.startify_lists = {
    { type = 'bookmarks', header = { 'Bookmarks' } },
    { type = 'sessions', header = { 'Sessions' } },
    { type = 'commands', header = { 'Commands' } },
    { type = 'files', header = { 'MRU' } },
    { type = 'dir', header = { 'MRU ' .. vim.fn.getcwd() } },
}
vim.g.startify_bookmarks = {
    { vi = '$MYVIMRC' },
    { vp = '$XDG_CONFIG_HOME/nvim/lua/plugins.lua' },
    { vt = '$XDG_CONFIG_HOME/wezterm/wezterm.lua' },
    { vt = '$XDG_CONFIG_HOME/fish/config.fish' },
    { df = '$HOME/workspace/dotfiles/' },
}
