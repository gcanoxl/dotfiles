require 'options'
require 'utils'
require 'plugin'
require 'keymaps'
require 'autocmds'

vim.api.nvim_command [[colorscheme catppuccin-macchiato]]

-- configurations for GUI clients
if vim.g.neovide then
	require 'gui'
end
