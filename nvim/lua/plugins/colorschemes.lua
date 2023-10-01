return {
	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
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
	"EdenEast/nightfox.nvim",

	-- tokyonight
	'folke/tokyonight.nvim',
}
