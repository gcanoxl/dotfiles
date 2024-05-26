return {
	{
		"mateuszwieloch/automkdir.nvim",
	},
	{
		"simonmclean/triptych.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = true,
	},
	-- Sniprun
	{

		"michaelb/sniprun",
		build = "sh ./install.sh",
		config = function()
			require("sniprun").setup({
				display = {
					"Terminal",
				},
				repl_enable = { "Python3_original" },
				live_mode_toggle = "enable",
			})
		end,
	},
	-- Submodes
	{
		"anuvyklack/hydra.nvim",
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
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

	-- Better Tab-Buffer Logic
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup({})
			require("telescope").load_extension("scope")
		end,
	},

	-- Bufferline
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		require("bufferline").setup({
	-- 			options = {
	-- 				diagnostics = "nvim_lsp",
	-- 				diagnostics_update_in_insert = true,
	-- 				offsets = {
	-- 					-- {
	-- 					-- 	filetype = "neo-tree",
	-- 					-- 	-- text = "File Explorer",
	-- 					-- 	-- text_align = "left",
	-- 					-- 	separator = true
	-- 					-- }
	-- 				},
	-- 				indicator = {
	-- 					style = "underline",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- Scrolling
	{
		"petertriho/nvim-scrollbar",
		dependencies = {
			"kevinhwang91/nvim-hlslens",
			"lewis6991/gitsigns.nvim",
		},

		config = function()
			require("scrollbar").setup({
				handle = {
					color = "#4B5263",
				},
			})
			require("scrollbar.handlers.search").setup({})
			require("gitsigns").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},
	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.o.foldcolumn = "0" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			---@diagnostic disable-next-line: missing-fields
			require("ufo").setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" }
				end,
			})
		end,
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
					enabled = false,
				},
			},
		},
	},

	-- Symbol Outline
	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				layout = {
					min_width = 32,
				},
				show_guides = true,
				keymaps = {
					["<tab>"] = "actions.tree_toggle",
					["<C-j>"] = false,
					["<C-k>"] = false,
				},
			})
		end,
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
		config = function()
			require("which-key").setup({})
		end,
	},

	-- Prettier UI
	"stevearc/dressing.nvim",

	-- Error List
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				auto_close = true,
			})
		end,
	},

	"mrjones2014/smart-splits.nvim",

	-- Better Buffer Closing
	"famiu/bufdelete.nvim",

	-- Todo List
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Dired
	{
		"X3eRo0/dired.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("dired").setup({
				show_colors = true,
			})
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
