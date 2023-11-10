local wezterm = require("wezterm")
local function font(opts)
    return wezterm.font_with_fallback({
        opts,
        "Symbols Nerd Font Mono",
    })
end

return {
    window_decorations = "RESIZE",
    -- color_scheme = "Github (base16)",
    -- color_scheme = "OneHalfDark",
    color_scheme = "Catppuccin Frappe",
    default_cursor_style = "SteadyBlock",
    hide_tab_bar_if_only_one_tab = true,
    font_size = 12,
    line_height = 1.25,
    scrollback_lines = 10000,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    font = font("JetBrainsMono Nerd Font"),
    font_rules = {
        {
            italic = true,
            intensity = "Normal",
            font = font({
                family = "VictorMono Nerd Font",
                style = "Italic",
            }),
        },
        {
            italic = true,
            intensity = "Half",
            font = font({
                family = "VictorMono Nerd Font",
                weight = "DemiBold",
                style = "Italic",
            }),
        },
        {
            italic = true,
            intensity = "Bold",
            font = font({
                family = "VictorMono Nerd Font",
                weight = "Bold",
                style = "Italic",
            }),
        },
    },
}
