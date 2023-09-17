return {
	-- BlankLine
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup()
		end,
	},

	-- Git Signs
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup({
				linehl = true,
				numhl = true,
			})
		end
	},

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
		config = function()
			require('trouble').setup {
				auto_close = true,
			}
		end
	},

	-- Mouse Movement
	{
		'phaazon/hop.nvim', branch = 'v2',
		config = function() require 'hop'.setup() end
	},

	-- Status Line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = function() require('lualine').setup({}) end
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

	'mrjones2014/smart-splits.nvim',
}
