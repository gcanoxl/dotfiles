return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		config = function()
			require('telescope').setup {
				defaults = {
					winblend = vim.g.preference.winblend,
					file_ignore_patterns = {
						-- flutter project
						"android", "ios", "web", "macos", "windows", "assets",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {}
					},
					emoji = {
						action = function(emoji)
							vim.api.nvim_put({ emoji.value }, 'c', false, true)
						end,
					}
				},
				pickers = {
					colorscheme = {
						enable_preview = true
					}
				}
			}
		end
	},

	-- TODO: how this works?
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").load_extension("ui-select")
		end
	},
}
