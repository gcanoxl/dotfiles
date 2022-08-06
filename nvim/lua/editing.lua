require 'plugins' {
	'phaazon/hop.nvim',
	branch = 'v2', -- optional but strongly recommended
}

require 'hop'.setup()
local nomap = require('keymaps')
nomap.n('f', ':HopChar1<CR>')
