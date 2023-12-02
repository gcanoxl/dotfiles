return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			shortcut_type = "letter",
			disable_move = true,
			config = {
				path = "~",
				project = {
					enable = true,
					limit = 8,
					action = function()
						local project = require("project_nvim.project")
						local root_dir = project.get_project_root()
						require("persistence").load({ last = true })
						vim.cmd("cd " .. root_dir)
					end,
				},
			},
			change_to_vcs_root = true,
		})
	end,
}
