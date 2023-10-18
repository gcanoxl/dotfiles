return {
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
