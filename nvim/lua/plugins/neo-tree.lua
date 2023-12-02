return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require("neo-tree").setup({
			window = {
				width = 30,
				mappings = {
					["<tab>"] = "open",
					["O"] = "expand_all_nodes",
					["C"] = "close_all_subnodes",
				},
			},
			filesystem = {
				use_libuv_file_watcher = true,
				always_show = {
					".gitignore",
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
			},
		})
	end,
}
