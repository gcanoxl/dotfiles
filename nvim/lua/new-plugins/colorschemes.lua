return {
	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			require('catppuccin').setup({
				flavour = "frappe",
				integrations = {
					neogit = false,
					hop = true,
					telescope = true,
					neotree = {
						enabled = true,
						show_root = true,
						transparent_panel = false,
					}
				}
			})
		end
	},

	-- nightfox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,

	},

	-- tokyonight
	{
		'folke/tokyonight.nvim',
		lazy = true,
	},
}
