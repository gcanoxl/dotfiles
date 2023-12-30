return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			direction = 'tab',
			float_opts = {
				border = vim.g.preference.border,
				winblend = vim.g.preference.winblend
			}
		})
	end
}
