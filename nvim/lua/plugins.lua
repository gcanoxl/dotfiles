local plugins = {
	-- Luapad
	'rafcamlet/nvim-luapad',

	-- Symbol Outline
	{
		'stevearc/aerial.nvim',
		config = function() require('plugins.nvim-aerial') end
	},

	-- Notify
	{
		'rcarriga/nvim-notify', config = function() require('plugins.nvim-notify') end
	},
	-- Keymap Reminder
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},

	-- Prettier UI
	'stevearc/dressing.nvim',

	-- Error List
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function() require 'plugins.trouble' end
	},

	-- Smart Splits
	{
		'mrjones2014/smart-splits.nvim'
	},

	-- Status Line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = function() require('lualine').setup({}) end
	},

	-- Mouse Movement
	{
		'phaazon/hop.nvim', branch = 'v2',
		config = function() require 'hop'.setup() end
	},

	-- Better Commenting
	{
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	},

	-- Git Client
	{
		'TimUntersberger/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		},
		config = function()
			require('neogit').setup({
				integrations = {
					diffview = true
				},
			})
		end
	},

	-- Session Manager
	{
		'Shatur/neovim-session-manager',
		config = function()
			require('session_manager').setup({
				autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
			})
		end
	},

	-- Syntax Highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = { 'HiPhish/nvim-ts-rainbow2' },
		config = function() require('plugins.treesitter') end
	},

	-- Text Objects based on treesitter
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},

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

	-- Lsp Manager
	"williamboman/mason-lspconfig.nvim",
	{
		"williamboman/mason.nvim",
		config = function() require('plugins.mason') end
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

	-- nippet Engine
	{
		'L3MON4D3/LuaSnip',
		config = function() require('plugins.luasnip') end
	},

	-- Better Buffer Closing
	'famiu/bufdelete.nvim',

	-- Todo List
	{
		"folke/todo-comments.nvim",
		config = function() require('todo-comments').setup() end
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim", version = 'v2.*',
		config = function()
			require("toggleterm").setup({
				direction = 'float',
				float_opts = {
					border = vim.g.preference.border,
					winblend = vim.g.preference.winblend
				}
			})
		end
	},

	-- Auto Pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require('nvim-autopairs').setup()
		end
	},

	{ import = "new-plugins" }
}

geem.initialize_lazy()
require('lazy').setup(plugins, {
	dev = {
		path = "~/Projects"
	}
})
