local wezterm = require("wezterm")
local function font(opts)
    return wezterm.font_with_fallback({
        opts,
        "Symbols Nerd Font Mono",
    })
end

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return {
    font = wezterm.font("JetBrainsMono Nerd Font Mono"),
    -- color_scheme = "Github",
    color_scheme = "Github (base16)",
    default_cursor_style = "SteadyBlock",
    hide_tab_bar_if_only_one_tab = true,
    font_size = 12,
    line_height = 1.5,
    scrollback_lines = 10000,
    enable_wayland = true,
    -- window_decorations = "RESIZE",
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
    font = font("JetBrainsMono Nerd Font Mono"),
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
