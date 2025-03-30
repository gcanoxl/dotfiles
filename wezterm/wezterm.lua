local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Operator Mono", {
	stretch = "Normal",
	weight = "Book",
})

config.font_size = 21
config.line_height = 1.6

return config
