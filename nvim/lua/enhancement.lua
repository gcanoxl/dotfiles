-- tree-sitter
require'plugins' {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
}

-- telescope
require'plugins' {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	requires = { {'nvim-lua/plenary.nvim'} }
}

-- keymaps
local nomap = require'keymaps'
nomap.nc('<C-c>', 'Telescope buffers')
nomap.lnc('<leader>', 'Telescope commands')
nomap.lnc('bb', 'Telescope buffers')
nomap.lnc('ff', 'Telescope find_files')
nomap.lnc('fr', 'Telescope oldfiles')
nomap.lnc('ss', 'Telescope live_grep')
nomap.lnc('hh', 'Telescope help_tags')

-- todolist
require'plugins' {
	"folke/todo-comments.nvim",
	requires = "nvim-lua/plenary.nvim",
}
require("todo-comments").setup {}
nomap.lnc('ts', 'TodoTelescope')
nomap.lnc('tt', 'TodoQuickFix')

-- terminal
require'plugins' {
	"akinsho/toggleterm.nvim", tag = 'v2.*'
}
require("toggleterm").setup()
nomap.nc('!', 'ToggleTerm')

