return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require('neo-tree').setup({
			window = {
				width = 24,
				mappings = {
					["<tab>"] = "open",
					["O"] = "expand_all_nodes",
					['C'] = 'close_all_subnodes',
				}
			},
			filesystem = {
				use_libuv_file_watcher = true,
			},
		})
	end
}
