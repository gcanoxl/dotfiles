local telescope_avali, telescope = pcall(require, 'telescope')
if not telescope_avali then return end

telescope.setup {
	defaults = {
		winblend = vim.g.preference.winblend
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {}
		}
	}
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension("flutter")
