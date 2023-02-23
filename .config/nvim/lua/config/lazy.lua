local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = false
    },
    install = {
        colorscheme = { "tokyonight", "sonokai" }
    },
    diff = {
        cmd = "terminal_git",
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    change_detection = {
        notify = false,
    },
})

-- don't load the plugins below
local builtins = { "gzip", "zip", "zipPlugin", "fzf", "tar", "tarPlugin", "getscript", "getscriptPlugin", "vimball",
    "vimballPlugin", "2html_plugin", "matchit", "matchparen", "logiPat", "rrhelper", "netrw", "netrwPlugin",
    "netrwSettings", "netrwFileHandlers", }

for _, plugin in ipairs(builtins) do
    vim.g["loaded_" .. plugin] = 1
end
