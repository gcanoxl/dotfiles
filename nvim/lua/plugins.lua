local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

local packer = require'packer'

packer.init({
	autoremove = true, 

	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end
	}

})

packer.use 'wbthomason/packer.nvim'

-- keymaps
local nomap = require'keymaps'
nomap.ln('pi', ':PackerInstall<CR>')
nomap.ln('ps', ':PackerSync<CR>')
nomap.ln('pc', ':PackerClean<CR>')

return packer.use
