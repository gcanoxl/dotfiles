local aerial_ok, aerial = pcall(require, 'aerial')
if not aerial_ok then return end

aerial.setup({
	layout = {
		min_width = 32,
	},
	show_guides = true,
	keymaps = {
		["<tab>"] = "actions.tree_toggle",
	}
})
