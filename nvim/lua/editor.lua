-- Snacks
vim.pack.add({ 'https://github.com/folke/snacks.nvim.git' })
---@type snacks.Config
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
        win = {
          list = {
            keys = {
              ['<Tab>'] = 'confirm',
              ['s'] = { 'select_and_next', mode = { 'n', 'i' } },
              ['<CR>'] = 'confirm',
            },
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

-- Gitsigns
vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = 'Next Hunk' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = 'Previous Hunk' })
  end,
})

-- which-key
vim.pack.add({ 'https://github.com/folke/which-key.nvim' })
require('which-key').setup({
  preset = 'modern',
})
