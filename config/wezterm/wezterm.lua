local wezterm = require 'wezterm';

return {
    font = wezterm.font("FiraCode Nerd Font Mono", {weight="Regular"}),
    -- font = wezterm.font("JetBrainsMono Nerd Font Mono"),
    hide_tab_bar_if_only_one_tab=true,
    font_size = 14,
    line_height = 1.4,
    -- themes : "Github", "GitHub Dark", "Tomorrow Night Eighties", "Gruvbox Dark", "OneHalfDark",
    color_scheme = "Github",
    window_padding = {
        left = 20,
        right = 0,
        top = 20,
        bottom = 0,
    }
}
