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
		-- local lsp_servers = require("configs.lsp").servers
		-- local dap_servers = require("configs.dap").servers
		-- require("mason-tool-installer").setup({
		-- 	ensure_installed = vim.tbl_extend("keep", lsp_servers, dap_servers),
		-- })
		require("mason-tool-installer").setup({})
		require("mason-nvim-dap").setup()
	end,
}
