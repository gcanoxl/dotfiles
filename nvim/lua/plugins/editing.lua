return {
	-- Auto Save
	-- TODO: disable <leader>fw for better building habits
	-- {
	-- 	"willothy/savior.nvim",
	-- 	dependencies = { "j-hui/fidget.nvim" },
	-- 	event = { "InsertEnter", "TextChanged" },
	-- 	config = true,
	-- },

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Mouse Movement
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		keys = {
			{
				"f",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"F",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},

	-- Better Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Auto Pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
