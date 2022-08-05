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
nomap.lnc('<leader>', 'Telescope commands')
nomap.lnc('ff', 'Telescope find_files')
nomap.lnc('ss', 'Telescope live_grep')
nomap.lnc('bb', 'Telescope buffers')
nomap.lnc('hh', 'Telescope help_tags')
