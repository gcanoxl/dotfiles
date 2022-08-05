local use = require'plugins'

-- status line
use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}


require('lualine').setup({})

-- colorschemes
use 'dr4vs/neon.nvim'
use 'folke/tokyonight.nvim'

vim.g.tokyonight_style = "storm"
vim.cmd[[colorscheme tokyonight]]
