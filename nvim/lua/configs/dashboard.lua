local dashboard = require("utils.dashboard")
dashboard({
	sections = {
		{ section = "header", pane = 1 },
		{
			section = "keys",
			gap = vim.api.nvim_win_get_height(0) > 30 and 1 or 0,
			padding = 1,
		},
		{ section = "startup" },
	},
})
