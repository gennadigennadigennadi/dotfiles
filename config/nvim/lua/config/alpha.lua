local startify = require "alpha.themes.startify"
startify.section.top_buttons.val = {
    startify.button("e", "New file", ":ene <bar> startinsert <cr>"),
    startify.button("pu", "Packer Update", ":PackerSync<cr>"),
    startify.file_button("$MYVIMRC", "vi", "init.lua"),
    startify.file_button("$XDG_CONFIG_HOME/nvim/lua/plugins.lua", "ep", "plugins.lua"),
    startify.file_button("$XDG_CONFIG_HOME/nvim/lua/keymappings.lua", "ek", "keymappings.lua"),
    startify.file_button("$XDG_CONFIG_HOME/fish/config.fish", "ef", "config.fish"),
    startify.file_button("$XDG_CONFIG_HOME/wezterm/wezterm.lua", "ew", "wezterm.lua"),
}
startify.section.header.val = require "alpha.fortune"()
startify.section.header.opts = { position = "center" }

require("alpha").setup(startify.opts)
