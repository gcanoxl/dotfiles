require 'options'
require 'utils'
require 'plugin'
require 'keymaps'

vim.api.nvim_command [[colorscheme tokyonight-moon]]

-- configurations for GUI clients
if vim.g.neovide then
	require 'gui'
end
