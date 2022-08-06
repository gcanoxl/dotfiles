require 'plugins' {
	'tpope/vim-fugitive'
}

local nomap = require 'keymaps'
nomap.lnc('gg', 'Git')
nomap.lnc('gp', 'Git push')
