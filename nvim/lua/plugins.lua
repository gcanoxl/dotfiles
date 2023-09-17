local plugins = {
	-- Dap
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python",
		},
		config = function() require('plugins.nvim-dap') end
	},

	-- Lsp UI
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function() require('plugins.nvim-lspsaga') end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" }
		}
	},


	-- Lsp Auto Format
	"lukas-reineke/lsp-format.nvim",

	-- Lsp Config
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neodev.nvim" }, -- for better config devlopment
		config = function()
			require('neodev').setup({})
			require('plugins.lsp')
		end
	},

	-- Lsp Icons
	'onsails/lspkind.nvim',

	-- Lsp Signature
	{
		"ray-x/lsp_signature.nvim",
		config = function() require "lsp_signature".setup({}) end
	},



	{ import = "new-plugins" }
}

geem.initialize_lazy()
require('lazy').setup(plugins, {
	dev = {
		path = "~/Projects"
	}
})

	{ import = "new-plugins" }
}

geem.initialize_lazy()
require('lazy').setup(plugins, {
	dev = {
		path = "~/Projects"
	}
})
