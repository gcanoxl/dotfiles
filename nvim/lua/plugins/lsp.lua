return {
	-- NeoConfig
	{
		"folke/neoconf.nvim",
		opts = {
			import = {
				vscode = true, -- local .vscode/settings.json
				coc = true, -- global/local coc-settings.json
				nlsp = true, -- global/local nlsp-settings.nvim json settings
			},
		},
	},
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
		dependencies = { "folke/neodev.nvim" }, -- for better config devlopment
		config = function()
			require("neodev").setup({})
			require("configs.lsp")
		end,
	},

	-- Lsp Icons
	"onsails/lspkind.nvim",

	-- Lsp Signature
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({})
		end,
	},
}
