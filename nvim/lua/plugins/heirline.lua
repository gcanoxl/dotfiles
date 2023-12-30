return {
	{
		"jonahgoldwastaken/copilot-status.nvim",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_status").setup()
		end,
	},
	{
		"rebelot/heirline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "UiEnter",
		config = function()
			require("configs.heirline")
		end,
	},
}
