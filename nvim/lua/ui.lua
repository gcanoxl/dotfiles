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
require('lualine').setup({})

-- UI2
require('vim._core.ui2').enable({ enable = true })

vim.pack.add({ 'https://github.com/folke/snacks.nvim.git' })
require('snacks').setup({
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = true },
  indent = { enabled = false },
  input = { enabled = true },
  picker = {
    enabled = true,
    sources = {
      explorer = {
        layout = {
          preset = 'sidebar',
          layout = {
            width = 30,
            min_width = 20,
            max_width = 40,
          },
        },
      },
    },
    win = {
      input = {
        bo = {
          autocomplete = false,
        },
      },
    },
  },
  notifier = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
})

-- which-key
vim.pack.add({ 'https://github.com/folke/which-key.nvim' })
require('which-key').setup({
  preset = 'modern',
})
