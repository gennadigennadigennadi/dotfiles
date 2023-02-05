local wezterm = require "wezterm"

return {
    font = wezterm.font "JetBrainsMono Nerd Font Mono",
    hide_tab_bar_if_only_one_tab = true,
    font_size = 16,
    line_height = 1.65,
    color_scheme = "tokyonight",
    keys = {
        {
            key = "r",
            mods = "CMD|SHIFT",
            action = wezterm.action.ReloadConfiguration,
        },
    },
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
}
