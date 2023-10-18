return {
	-- BlankLine
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			-- require("indent_blankline").setup()
		end,
	},


	-- Symbol Outline
	{
		'stevearc/aerial.nvim',
		config = function()
			require('aerial').setup({
				layout = {
					min_width = 32,
				},
				show_guides = true,
				keymaps = {
					["<tab>"] = "actions.tree_toggle",
					["<C-j>"] = false,
					["<C-k>"] = false,
				}
			})
		end
	},

	-- Notify
	{
		'rcarriga/nvim-notify',
		config = function()
			require('notify').setup({
				top_down = false,
				max_width = 80,
				background_colour = "#000000",
			})

			vim.notify = require('notify')

			local telescope_ok, telescope = pcall(require, 'telescope')
			if telescope_ok then
				telescope.load_extension("notify")
			end
		end
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
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function() require 'hop'.setup() end
	},

	-- Status Line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = function() require('lualine').setup({}) end
	},

	-- Project
	{

		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {
				manual_mode = true,
			}
			require('telescope').load_extension('projects')
		end
	},

	'mrjones2014/smart-splits.nvim',

	-- Better Buffer Closing
	'famiu/bufdelete.nvim',

	-- Todo List
	{
		"folke/todo-comments.nvim",
		config = function() require('todo-comments').setup() end
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = 'v2.*',
		config = function()
			require("toggleterm").setup({
				direction = 'tab',
				float_opts = {
					border = vim.g.preference.border,
					winblend = vim.g.preference.winblend
				}
			})
		end
	},

	-- Dired
	{
		'X3eRo0/dired.nvim',
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("dired").setup {
				show_colors = true,
			}
		end
	},

	-- Better Buffer Closing
	'famiu/bufdelete.nvim',

	-- Todo List
	{
		"folke/todo-comments.nvim",
		config = function() require('todo-comments').setup() end
	},

	-- Auto Pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require('nvim-autopairs').setup()
		end
	},
}
