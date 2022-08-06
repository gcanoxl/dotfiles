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

-- bufferline
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
require("bufferline").setup{}

--local nomap = require'keymaps'
-- TODO: add cmd+number and C-tab C-S-tab keymaps
