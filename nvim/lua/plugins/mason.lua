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
			ui = {
				border = vim.g.preference.border,
			},
			keymaps = {
				toggle_package_expand = "<TAB>",
			},
		})

		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- TODO: use a global variable
				"lua_ls",
				"lua_ls",
				"vimls",
				"pyright",
				"jsonls",
				"yamlls",
				"grammarly",
				"gopls",
				"vuels",
				"tsserver",
				"html",
				"yapf",
				"codelldb",
			},
		})
		require("mason-nvim-dap").setup()
	end,
}
