local status_ok, mason = pcall(require, 'mason')
if not status_ok then return end

mason.setup({
	ui = {
		border = vim.g.preference.border,
	},
	keymaps = {
		toggle_package_expand = "<TAB>",
	},
})

local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
print(status_ok)
if status_ok then
	mason_lspconfig.setup({
		automatic_installation = true,
	})
end
