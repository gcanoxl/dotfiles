local status_ok, mason = pcall(require, 'mason')
if not status_ok then return end

mason.setup({
	ui = {
		border = vim.g.preference.border,
	},
	keymaps = {
		toggle_package_expand = "<TAB>",
	}
})
