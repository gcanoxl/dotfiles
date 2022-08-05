local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

local packer = require'packer'

packer.init({
	ensure_dependencies = true,

	autoremove = true,
	auto_clean = true,

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

return packer.use
