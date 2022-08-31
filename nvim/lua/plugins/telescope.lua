local telescope_avali, telescope = pcall(require, 'telescope')
if not telescope_avali then return end

telescope.setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {}
		}
	}
}
require("telescope").load_extension("ui-select")
