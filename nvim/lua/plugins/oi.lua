return {
	{
		"stevearc/overseer.nvim",
		opts = {
			templates = { "builtin", "user.oi_run" },
			task_list = {
				direction = "right",
			},
		},
	},
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup()
		end,
	},
}
