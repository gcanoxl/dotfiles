return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require('neotree').setup({
			window = {
				width = 24,
				mappings = {
					["<tab>"] = "open",
				}
			},
			filesystem = {
				use_libuv_file_watcher = true,
			},
		})
	end
}
