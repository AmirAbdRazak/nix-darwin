local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- font settings
config.font_size = 19
config.line_height = 1.2
config.font = wezterm.font("JetBrains Mono")



-- Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white"
}
config.color_scheme = 'Catpuccin Latte'

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.background = {
	{
		source = {
			File = wezterm.home_dir .. "/.config/wezterm/assets/amiya-wallpaper-bg.jpeg",
		},
		hsb = { brightness = 0.025 },
	},
}

-- Miscellaneous settings
config.max_fps = 165
config.prefer_egl = true

return config
