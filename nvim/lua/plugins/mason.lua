return {
	"williamboman/mason-lspconfig.nvim",
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = vim.g.preference.border,
				},
				keymaps = {
					toggle_package_expand = "<TAB>",
				},
			})

			local lsp_config_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
			if lsp_config_status_ok then
				mason_lspconfig.setup({
					automatic_installation = true,
				})
			end
		end,
	},
}
