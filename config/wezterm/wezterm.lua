local wezterm = require 'wezterm';

return {
    font = wezterm.font("FiraCode Nerd Font Mono", {weight="Regular"}),
    -- font = wezterm.font("JetBrainsMono Nerd Font Mono"),
    hide_tab_bar_if_only_one_tab=true,
    font_size = 14,
    line_height = 1.0,
    -- color_scheme = "Github",
    -- color_scheme = "GitHub Dark",
    color_scheme = "Tomorrow Night Eighties",
    -- color_scheme = "OneHalfLight",
    window_padding = {
        left = 10,
        right = 0,
        top = 20,
        bottom = 0,
    }
}
