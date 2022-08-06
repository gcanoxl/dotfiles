local nomap = require 'keymaps'

-- VV client
local guiKeySupport = 0
if vim.g.vv == 1 then
	guiKeySupport = 1
	vim.cmd [[VVset width=100%]]
	vim.cmd [[VVset height=100%]]
	vim.cmd [[VVset bold=1]]
	vim.cmd [[VVset fullscreen=0]]
	vim.cmd [[VVset fontfamily=Courier,\ Hack\ Nerd\ Font]]
	vim.cmd [[VVset fontsize=18]]
	nomap.lnc('tf', 'VVset invfullscreen')
end

--
local use = require 'plugins'

-- status line
--[[
--use {
'nvim-lualine/lualine.nvim',
requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
require('lualine').setup({})
]] --
use 'feline-nvim/feline.nvim'
require('feline').setup()

-- colorschemes
use 'dr4vs/neon.nvim'
use 'folke/tokyonight.nvim'

vim.g.tokyonight_style = "storm"
vim.cmd [[colorscheme tokyonight]]

-- bufferline
use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
require("bufferline").setup {
	options = {
		numbers = "ordinal",
		offsets = {
			{
				filetype = "NvimTree",
				text_align = "left"
			}
		}
	}
}

-- keymaps
nomap.nc('<C-w>c', 'bdelete')

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
nomap.nc('}', 'BufferLineCycleNext')
nomap.nc('{', 'BufferLineCyclePrev')

if guiKeySupport == 1 then
	nomap.nc('<D-1>', 'BufferLineGoToBuffer 1')
	nomap.nc('<D-2>', 'BufferLineGoToBuffer 2')
	nomap.nc('<D-3>', 'BufferLineGoToBuffer 3')
	nomap.nc('<D-4>', 'BufferLineGoToBuffer 4')
	nomap.nc('<D-5>', 'BufferLineGoToBuffer 5')
	nomap.nc('<D-6>', 'BufferLineGoToBuffer 6')
	nomap.nc('<D-7>', 'BufferLineGoToBuffer 7')
	nomap.nc('<D-8>', 'BufferLineGoToBuffer 8')
	nomap.nc('<D-9>', 'BufferLineGoToBuffer 9')
	nomap.nc('<D-0>', 'BufferLineGoToBuffer 10')
	nomap.nc('<C-Tab>', 'BufferLineCycleNext')
	nomap.nc('<C-S-tab>', 'BufferLineCyclePrev')
end
