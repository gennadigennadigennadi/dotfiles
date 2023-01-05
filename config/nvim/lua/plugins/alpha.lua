return {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
        local startify = require "alpha.themes.startify"
        startify.section.top_buttons.val = {
            startify.button("e", "New file", ":ene <bar> startinsert <cr>"),
            startify.file_button("$MYVIMRC", "vi", "init.lua"),
            startify.file_button("$XDG_CONFIG_HOME/fish/config.fish", "ef", "config.fish"),
            startify.file_button("$XDG_CONFIG_HOME/wezterm/wezterm.lua", "ew", "wezterm.lua"),
        }
        startify.section.header.val = require "alpha.fortune" ()
        startify.section.header.opts = { position = "center" }

        require("alpha").setup(startify.opts)
    end
}
