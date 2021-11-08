local wezterm = require "wezterm"

return {
    font = wezterm.font "FiraCode Nerd Font Mono",
    -- font = wezterm.font("JetBrainsMono Nerd Font Mono"),
    hide_tab_bar_if_only_one_tab = true,
    font_size = 13,
    line_height = 1.4, -- themes : "Github", "GitHub Dark", "Gruvbox Dark", "OneHalfDark",
    color_scheme = "nord",
    colors = { background = "#fdf7e7" },
    window_padding = {
        -- left = 20,
        right = 0,
        -- top = 20,
        bottom = 0,
    },
}
