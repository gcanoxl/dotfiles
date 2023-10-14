require 'options'
require 'utils'
require 'plugin'
require 'keymaps'

vim.api.nvim_command [[colorscheme dawnfox]]

-- configurations for GUI clients
if vim.g.neovide then
	require 'gui'
end
