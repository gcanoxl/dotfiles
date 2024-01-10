return {
	-- Lsp UI
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				request_timeout = 8000,
				lightbulb = {
					enable = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- Lsp Config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"folke/neoconf.nvim",
		},
		config = function()
			require("neodev").setup({})
			require("neoconf").setup({
				import = {
					vscode = false, -- local .vscode/settings.json
					coc = false, -- global/local coc-settings.json
					nlsp = false, -- global/local nlsp-settings.nvim json settings
				},
			})

			require("configs.lsp")
		end,
	},

	-- Lsp Icons
	"onsails/lspkind.nvim",

	-- Lsp Signature
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
