local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then return end

bufferline.setup {
	options = {
		numbers = "ordinal",
		offsets = {
			{
				filetype = "neo-tree",
				text_align = "left"
			}
		}
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
}
