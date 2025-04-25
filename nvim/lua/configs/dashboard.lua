local dashboard = require("utils.dashboard")
local is_higherline = vim.api.nvim_win_get_height(0) > 30

local section_highline = {
	{ section = "header", pane = 1, padding = 2 },
	{
		section = "keys",
		gap = 1,
		padding = 1,
	},
	{ section = "startup" },
}

local section_lowline = {
	{ section = "startup", padding = 1 },
	{
		section = "keys",
		gap = 1,
	},
}
dashboard({
	sections = is_higherline and section_highline or section_lowline,
})
