local wezterm = require "wezterm"

return {
    -- font = wezterm.font "FiraCode Nerd Font Mono",
    font = wezterm.font "JetBrainsMono Nerd Font Mono",
    hide_tab_bar_if_only_one_tab = true,
    font_size = 13,
    line_height = 1.5, -- themes : "Github", "GitHub Dark", "Gruvbox Dark", "OneHalfDark",
    color_scheme = "Github (base16)",
    -- color_scheme = "GitHub Dark",
    keys = {
        {
            key = 'r',
            mods = 'CMD|SHIFT',
            action = wezterm.action.ReloadConfiguration,
        },
    },
    window_padding = {
        left = 10,
        right = 0,
        top = 10,
        bottom = 0,
    },
}
