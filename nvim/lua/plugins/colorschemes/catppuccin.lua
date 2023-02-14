local status_ok, catppuccin = pcall(require, 'catppuccin')
if not status_ok then return end

catppuccin.setup({
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
