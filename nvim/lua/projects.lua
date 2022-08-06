-- git
require 'plugins' {
	'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'
}

require('neogit').setup()
local nomap = require 'keymaps'
nomap.lnc('gg', 'Neogit')

-- session manager
require 'plugins' 'Shatur/neovim-session-manager'
require('session_manager').setup({})
nomap.lnc('pR', 'SessionManager load_last_session')
nomap.lnc('pf', 'SessionManager load_session')
nomap.lnc('pd', 'SessionManager delete_session')
