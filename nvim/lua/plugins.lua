local plugins = {
	-- Colorschemes
	{
		"catppuccin/nvim", name = "catppuccin", lazy = true,
		config = function() require('plugins.colorschemes.catppuccin') end
	},
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ 'folke/tokyonight.nvim',  lazy = true },

	-- Keymap Reminder
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},

	-- Code Runner
	{ 'CRAG666/code_runner.nvim', dependencies = 'nvim-lua/plenary.nvim',
		config = function() require('plugins.code-runner') end },

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
		config = function()
			require('lualine').setup({})
		end
	},

	-- Fuzzy Finder
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		config = function() require('plugins.telescope') end
	},

	'nvim-telescope/telescope-ui-select.nvim',

	-- File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim", branch = "v2.x",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function() require 'plugins.neo-tree' end
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
		'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim',
		config = function() require('neogit').setup() end
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
		config = function() require('plugins.treesitter') end
	},

	-- Text Objects based on treesitter
	'nvim-treesitter/nvim-treesitter-textobjects',

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

	-- Completion Engine
	{
		'hrsh7th/nvim-cmp',
		config = function() require 'plugins.cmp' end
	},

	-- Lsp Completion Source
	'hrsh7th/cmp-nvim-lsp',

	-- Snippet Completion Source
	'saadparwaiz1/cmp_luasnip',

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

	-- Go Support
	{
		'ray-x/go.nvim',
		dependencies = { 'ray-x/guihua.lua' },
		ft = { 'go' },
		config = function() require('plugins.go') end
	},

	{
		'akinsho/flutter-tools.nvim',
		ft = { 'dart' },
		config = function() require('plugins.flutter') end
	}
}

geem.initialize_lazy()
require('lazy').setup(plugins, {
	dev = {
		path = "~/Projects"
	}
})
