local telescope_avali, telescope = pcall(require, 'telescope')
if not telescope_avali then return end

telescope.setup {
	defaults = {
		winblend = vim.g.preference.winblend
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
require("telescope").load_extension("ui-select")
