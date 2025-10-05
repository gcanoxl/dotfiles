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

	-- Lsp Icons
	"onsails/lspkind.nvim",

	-- -- Lsp Signature
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
	},
}
