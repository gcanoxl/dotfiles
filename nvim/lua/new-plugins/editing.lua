return {
	-- Better Commenting
	{
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	},

	-- Auto Pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require('nvim-autopairs').setup()
		end
	},

	-- Surrounding
	{
		'echasnovski/mini.surround',
		version = '*',
		config = function()
			require('mini.surround').setup()
		end
	},
}
