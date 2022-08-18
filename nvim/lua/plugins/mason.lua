local status_ok, mason = pcall(require, 'mason')
if not status_ok then return end

mason.setup({
	ui = {
		border = "rounded",
	},
	keymaps = {
		toggle_package_expand = "<TAB>",
	}
})
