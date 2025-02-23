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
config.color_scheme = 'Catppuccin Mocha'

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 0.6
config.macos_window_background_blur = 20

-- Miscellaneous settings
config.max_fps = 165
config.prefer_egl = true

return config
