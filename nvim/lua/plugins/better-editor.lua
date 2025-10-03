return {
	-- Formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "yapf" },
				json = { "jsonls" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		},
	},

	-- Indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = {
				show_end = false,
				show_start = false,
			},
		},
	},

	-- Notify
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("notify").setup({
				top_down = false,
				max_width = 80,
				background_colour = "#000000",
			})

			vim.notify = require("notify")

			local telescope_ok, telescope = pcall(require, "telescope")
			if telescope_ok then
				telescope.load_extension("notify")
			end
		end,
	},

	-- Keymap Reminder
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- Error List
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				auto_close = true,
				modes = {
					errors = {
						mode = "diagnostics",
						filter = function(items)
							return vim.tbl_filter(function(item)
								return item.severity == vim.diagnostic.severity.ERROR
							end, items)
						end,
					},
				},
			})
		end,
	},

	"mrjones2014/smart-splits.nvim",

	-- Todo List
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Todo List
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},
}
