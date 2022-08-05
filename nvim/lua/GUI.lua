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

local nomap = require'keymaps'
nomap.n('<D-tab>', 'BufferLineCycleNext')
nomap.n('<M-1>', '<CMD>BufferLineCycleNext 1<CR>')
nomap.lnc('1', 'BufferLineGoToBuffer 1')
nomap.lnc('2', 'BufferLineGoToBuffer 2')
nomap.lnc('3', 'BufferLineGoToBuffer 3')
nomap.lnc('4', 'BufferLineGoToBuffer 4')
nomap.lnc('5', 'BufferLineGoToBuffer 5')
nomap.lnc('6', 'BufferLineGoToBuffer 6')
nomap.lnc('7', 'BufferLineGoToBuffer 7')
nomap.lnc('8', 'BufferLineGoToBuffer 8')
nomap.lnc('9', 'BufferLineGoToBuffer 9')
nomap.lnc('0', 'BufferLineGoToBuffer 10')
