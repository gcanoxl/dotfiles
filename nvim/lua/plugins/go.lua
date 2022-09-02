local status_ok, go = pcall(require, 'go')
if not status_ok then return end

go.setup()

-- keymaps
local opts = { noremap = true, silent = true }
vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>tt', ':GoTest<CR>', opts)

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
