-- TODO: delete this file after refactor
--
geem.initialize_packer()

local packer = require 'packer'

packer.init({
	ensure_dependencies = true,

	display = {
		keybindings = { -- Keybindings for the display window
			toggle_info = '<TAB>',
		},
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end
	}

})

packer.use 'wbthomason/packer.nvim'

local nomap = require 'keymaps'
nomap.lnc('pi', 'PackerInstall')
nomap.lnc('pc', 'PackerClean')
nomap.lnc('pu', 'PackerSync')
nomap.lnc('pl', 'PackerStatus')

return packer.use
