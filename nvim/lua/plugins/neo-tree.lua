local status_ok, neotree = pcall(require, 'neo-tree')
if not status_ok then return end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
neotree.setup({
	window = {
		width = 24,
		mappings = {
			["<tab>"] = "open",
		}
	}
})
