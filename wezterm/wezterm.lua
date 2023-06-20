-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

--------------------------------------------------------
--------------------------------------------------------
-- This is where you actually apply your config choices

local function osVals(linuxVal, macVal)
    if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
        return linuxVal
    elseif (wezterm.target_triple == 'x86_64-apple-darwin'
            or wezterm.target_triple == 'aarch64-apple-darwin') then
        return macVal
    end
    return nil
end

config.color_scheme = "Andromeda"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = osVals(14.0, 17.0)

config.window_frame = {
    -- font = wezterm.font({ family = "Roboto", weight = "Bold" }),

    -- The size of the font in the tab bar.
    font_size = osVals(12.0, 15.0),

    -- The overall background color of the tab bar when
    -- the window is focused
    -- active_titlebar_bg = "#333333",

    -- The overall background color of the tab bar when
    -- the window is not focused
    -- inactive_titlebar_bg = "#333333",
}

config.colors = {
    tab_bar = {
        -- The color of the inactive tab bar edge/divider
        inactive_tab_edge = "#575757",
    },
}

-- and finally, return the configuration to wezterm
return config
