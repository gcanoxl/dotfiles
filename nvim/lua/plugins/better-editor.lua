return {
	-- Better-ZZ
	{
		"gcanoxl/better-zz.nvim",
		config = function()
			require('better-zz').setup({
				percentage = 0.15
			})
		end
	},
	-- Scrolling
	{
		"petertriho/nvim-scrollbar",
		dependencies = {
			'kevinhwang91/nvim-hlslens',
			'lewis6991/gitsigns.nvim'
		},

		config = function()
			require("scrollbar").setup({
				handle = {
					color = "#4B5263",
				},
			})
			require("scrollbar.handlers.search").setup({})
			require('gitsigns').setup()
			require("scrollbar.handlers.gitsigns").setup()
		end

	},
	-- Folding
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		config = function()
			vim.o.foldcolumn = '1' -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
			require('ufo').setup({
				provider_selector = function(_, _, _)
					return { 'treesitter', 'indent' }
				end
			})
		end
	},
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				signature = {
					enabled = false
				}
			}
		},
	},
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
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- NOTE: I don't know why this doesn't work properly
		--
		-- stylua: ignore
		-- keys = {
		-- 	{ "f", mode = { "n", "x", "o" }, require("flash").jump, desc = "Flash" },
		-- },
		config = function()
			require("flash").setup({})
			vim.keymap.set("n", "f", require("flash").jump, { noremap = true })
		end,

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
