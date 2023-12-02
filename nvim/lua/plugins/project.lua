return {
	-- Session Management
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			options = { "buffers", "curdir", "tabpages", "winsize" },
		},
	},

	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				manual_mode = false,
				patterns = {
					".git",
					".project",
				},
				scope_chdir = "global",
			})
			require("telescope").load_extension("projects")
		end,
	},
}
