-- TODO: delete this file after refactor
require 'plugins' {
	'phaazon/hop.nvim',
	branch = 'v2', -- optional but strongly recommended
	config = function()
		require 'hop'.setup()
	end
}
local nomap = require('keymaps')
nomap.n('f', ':HopChar1<CR>')
