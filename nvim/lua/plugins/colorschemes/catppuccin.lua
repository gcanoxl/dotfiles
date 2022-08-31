local status_ok, catppuccin = pcall(require, 'catppuccin')
if not status_ok then return end

catppuccin.setup({
	integrations = {
		neogit = false,
		hop = true,
		neotree = {
			enabled = true,
			show_root = true, -- makes the root folder not transparent
			transparent_panel = false, -- make the panel transparent
		}
	}
})
