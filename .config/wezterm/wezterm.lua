local wezterm = require "wezterm"
local function font(opts)
    return wezterm.font_with_fallback({
        opts,
        "Symbols Nerd Font Mono",
    })
end

return {
    font = wezterm.font "JetBrainsMono Nerd Font Mono",
    color_scheme_dirs = { os.getenv( "HOME" ) .. '/.local/share/nvim/lazy/tokyonight.nvim/extras/wezterm/' },
    color_scheme = "tokyonight_moon",
    -- color_scheme = "Github",
    default_cursor_style = 'SteadyBlock',
    hide_tab_bar_if_only_one_tab = true,
    font_size = 15,
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
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    font = font("FiraCode Nerd Font"),
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
    window_frame = {
        -- The font used in the tab bar.
        -- Roboto Bold is the default; this font is bundled
        -- with wezterm.
        -- Whatever font is selected here, it will have the
        -- main font setting appended to it to pick up any
        -- fallback fonts you may have used there.
        font = font({ family = "FiraCode Nerd Font", weight = "Bold" }),

        -- The size of the font in the tab bar.
        -- Default to 10. on Windows but 12.0 on other systems
        font_size = 14.0,

        -- The overall background color of the tab bar when
        -- the window is focused
        active_titlebar_bg = "#191b28",

        -- The overall background color of the tab bar when
        -- the window is not focused
        inactive_titlebar_bg = "#1e2030",
    },
    colors = {
        tab_bar = {
            -- The color of the inactive tab bar edge/divider
            inactive_tab_edge = "#1e2030",
            background = "#191b28",
            active_tab = {
                fg_color = "#82aaff",
                bg_color = "#222436",
            },
            inactive_tab = {
                bg_color = "#1e2030",
                fg_color = "#545c7e",
            },
            inactive_tab_hover = {
                bg_color = "#1e2030",
                fg_color = "#82aaff",
            },
            new_tab_hover = {
                fg_color = "#1e2030",
                bg_color = "#82aaff",
            },
            new_tab = {
                fg_color = "#82aaff",
                bg_color = "#191b28",
            },
        },
    },
}
