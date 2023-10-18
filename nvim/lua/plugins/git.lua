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

	-- Git Client
	{
		'TimUntersberger/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		},
		config = function()
			require('neogit').setup({
				integrations = {
					diffview = true
				},
			})
		end
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		}
	},

}
