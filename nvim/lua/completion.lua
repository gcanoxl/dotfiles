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
nomap.ln('ff', ':Telescope find_files<CR>')
nomap.ln('ss', ':Telescope live_grep<CR>')
nomap.ln('bb', ':Telescope buffers<CR>')
nomap.ln('hh', ':Telescope help_tags<CR>')
