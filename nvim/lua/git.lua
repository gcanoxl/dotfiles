require 'plugins' {
	'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'
}

require('neogit').setup()
local nomap = require 'keymaps'
nomap.lnc('gg', 'Neogit')
