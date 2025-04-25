local dashboard = require("utils.dashboard")
local is_higherline = vim.api.nvim_win_get_height(0) > 30
dashboard({
	sections = {
		{ section = "header", pane = 1, padding = is_higherline and 2 or 1 },
		{
			section = "keys",
			gap = is_higherline and 1 or 0,
			padding = is_higherline and 1 or 0,
		},
		{ section = "startup" },
	},
})
