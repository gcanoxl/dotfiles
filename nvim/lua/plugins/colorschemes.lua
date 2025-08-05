return {
	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				integrations = {
					neogit = false,
					hop = true,
					neotree = {
						enabled = true,
						show_root = true,
						transparent_panel = false,
					},
				},
			})
		end,
	},

	-- nightfox
	"EdenEast/nightfox.nvim",

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		config = function()
			if vim.g.preference.border == "none" then
				require("tokyonight").setup({
					on_highlights = function(hl, c)
						local prompt = "#2d3149"
						-- Lsp Signature
						hl.FloatBorder = {
							bg = c.bg_dark,
							fg = c.bg_dark,
						}
						-- LspSaga
						hl.HoverBorder = {
							bg = c.bg_dark,
							fg = c.bg_dark,
						}
					end,
				})
			end
		end,
	},

	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
}
