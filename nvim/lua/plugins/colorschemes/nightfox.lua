local status_ok, _ = pcall(require, 'nightfox')
if not status_ok then return end

vim.api.nvim_command [[colorscheme nordfox]]
