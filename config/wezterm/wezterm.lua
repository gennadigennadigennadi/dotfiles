local wezterm = require "wezterm"
local function font(opts)
    return wezterm.font_with_fallback({
        opts,
        "Symbols Nerd Font Mono",
    })
end

return {
    font = wezterm.font "JetBrainsMono Nerd Font",
    color_scheme = "Github (base16)",
    default_cursor_style = 'SteadyBlock',
    hide_tab_bar_if_only_one_tab = true,
    font_size = 12,
    line_height = 1.5,
    scrollback_lines = 10000,
    keys = {
        {
            key = "r",
            mods = "CMD|SHIFT",
            action = wezterm.action.ReloadConfiguration,
        },
    },
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },
    -- font = font("FiraCode Nerd Font"),
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
