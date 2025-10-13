return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	priority = 100,
	config = function()
		require("mason").setup({
			keymaps = {
				toggle_package_expand = "<TAB>",
			},
		})

		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
		local lsp_servers = require("core.configs").lsp.servers
		require("mason-tool-installer").setup({
			ensure_installed = lsp_servers,
		})
		require("mason-nvim-dap").setup()
	end,
}
