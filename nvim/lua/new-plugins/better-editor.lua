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
}
