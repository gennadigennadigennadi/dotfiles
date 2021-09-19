local M = {}

function M.setup() 
    -- vim.g.startify_change_to_dir = true
    vim.g.startify_change_to_vcs_root = true
    vim.g.startify_custom_header = 'startify#center(startify#fortune#cowsay())'

    vim.g.startify_lists = {
        { type = 'bookmarks', header = {'Bookmarks'} },
        { type = 'sessions', header = {'Sessions'} },
        { type = 'commands', header = {'Commands'} },
        { type = 'files', header = {'MRU'} },
        { type = 'dir', header = {'MRU ' .. vim.fn.getcwd()} }
    }
    vim.g.startify_bookmarks = {
        { vi = '$MYVIMRC' }, 
        { vp = '$XDG_CONFIG_HOME/nvim/plugin/plugins.lua' }, 
        { df = '$HOME/workspace/dotfiles/' },
        { pdc = '/Volumes/development/dmk/core/README.md' },
        { pdj = '/Volumes/development/dmk/jpxo/README.md' }
    }
    -- vim.g.startify_commands = {
    --     { du = { 'start docker', '!docker-compose up -d' } }
    -- }
end

return M
