-- TODO: delete this file after refactor
-- git
require 'plugins' {
	'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
	config = function()
		require('neogit').setup()
	end
}
local nomap = require 'keymaps'
nomap.lnc('gg', 'Neogit')

-- session manager
require 'plugins' {
	'Shatur/neovim-session-manager',
	config = function()
		require('session_manager').setup({})
	end
}
nomap.lnc('pR', 'SessionManager load_last_session')
nomap.lnc('pf', 'SessionManager load_session')
nomap.lnc('ps', 'SessionManager save_current_session')
nomap.lnc('pd', 'SessionManager delete_session')
