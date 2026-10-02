-- Colorscheme
vim.pack.add({
  'https://github.com/rebelot/kanagawa.nvim.git',
  {
    name = 'catppuccin',
    src = 'https://github.com/catppuccin/nvim.git',
  },
  'https://github.com/folke/tokyonight.nvim.git',
  'https://github.com/savq/melange-nvim.git',
})

vim.cmd([[colorscheme tokyonight-moon]])

-- Statusline
vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
})
require('lualine').setup({
  options = {
    globalstatus = true,
  },
})

-- UI2
require('vim._core.ui2').enable({ enable = true })
