local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

config.font = wezterm.font("Operator Mono", {
	stretch = "Normal",
	weight = "Book",
})

config.font_size = 18
config.line_height = 1.0

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
