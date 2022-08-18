local geem_plugins = {
	-- manage itself
	'wbthomason/packer.nvim',

	--
}

geem.initialize_packer()

local status_ok, packer = pcall(require, 'packer')
if status_ok then
	packer.startup({
		function(use)
			for _, plugin in ipairs(geem_plugins) do
				use(plugin)
			end
		end,
		config = {
			ensure_dependencies = true,

			display = {
				keybindings = { -- Keybindings for the display window
					toggle_info = '<TAB>',
				},
				open_fn = function()
					return require('packer.util').float({ border = 'rounded' })
				end
			}
		}
	})
end
