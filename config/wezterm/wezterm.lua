local wezterm = require 'wezterm';

return {
    font = wezterm.font("FiraCode Nerd Font Mono", {weight="Regular"}),
    hide_tab_bar_if_only_one_tab=true,
    font_size = 13,
    line_height = 1.25,
    -- color_scheme = "Github",
    color_scheme = "OneHalfDark",
    window_padding = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0,
    }
}
