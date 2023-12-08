local wezterm = require("wezterm")

config = wezterm.config_builder()

local function osVals(linuxVal, macVal)
	if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
		return linuxVal
	elseif wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
		return macVal
	end
	return nil
end

config.color_scheme = "Andromeda"
config.font = wezterm.font_with_fallback {
	{ family = "Monaspace Neon",
		harfbuzz_features = {
			'calt',
			'liga',
			-- 'dlig', -- Enable all ligatures
			'ss01', -- ligatures related to the equals glyph like != and === and =~.
			'ss02', -- ligatures related to the greater than or less than operators.
			'ss03', -- ligatures related to arrows like -> and =>.
			'ss04', -- ligatures related to markup, like </ and />.
			-- 'ss05', -- ligatures related to the F# programming language, like |>.
			'ss06', -- ligatures related to repeated uses of # such as ## or ###.
			'ss07', -- ligatures related to the asterisk like ***.
			'ss08', -- ligatures related to combinations like .= or .-.
		}
	},
	{ family = "Hack Nerd Font" }
}
config.font_size = osVals(14.0, 17)

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
