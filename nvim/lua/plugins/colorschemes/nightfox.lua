local status_ok, nightfox = pcall(require, 'nightfox')
if not status_ok then return end

vim.api.nvim_command [[colorscheme nordfox]]
