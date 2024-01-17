return {
	-- Auto Save
	-- TODO: disable <leader>fw for better building habits
	{
		"willothy/savior.nvim",
		dependencies = { "j-hui/fidget.nvim" },
		event = { "InsertEnter", "TextChanged" },
		config = true,
	},

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

	-- Surrounding
	-- {
	-- 	'echasnovski/mini.surround',
	-- 	version = '*',
	-- 	config = function()
	-- 		require('mini.surround').setup()
	-- 	end
	-- },
}
