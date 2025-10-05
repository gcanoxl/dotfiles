---@diagnostic disable: missing-parameter
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

	-- better list
	{
		"folke/trouble.nvim",
		opts = {
			auto_preview = false,
			auto_refresh = true,
			auto_close = true,
		},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
			{ "<leader>xf", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
			{ "<leader>xs", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/..." },
			{
				"<c-s-p>",
				function()
					require("trouble").prev()
				end,
				desc = "Previous Diagnostics",
			},
			{
				"<c-s-n>",
				function()
					require("trouble").next()
				end,
				desc = "Next Diagnostics",
			},
			{
				"<c-s-o>",
				function()
					require("trouble").jump_only()
				end,
				desc = "Jump",
			},
			{
				"<c-s-i>",
				function()
					require("trouble").jump_split()
				end,
				desc = "Jump Split",
			},
		},
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
