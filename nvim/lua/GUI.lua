local use = require'plugins'

-- status line
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

require('lualine').setup()

-- colorscheme
use 'dr4vs/neon.nvim'
vim.cmd[[colorscheme neon]]
