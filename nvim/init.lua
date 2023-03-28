require 'options'
require 'utils'
require 'plugins'
require 'keymaps'

vim.api.nvim_command [[colorscheme nordfox]]

-- configurations for GUI clients
if vim.g.neovide then
	require 'gui'
end
