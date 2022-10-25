require 'options'
require 'utils'
geem.initialize_packer()
require 'plugins'
require 'keymaps'

vim.api.nvim_command [[colorscheme catppuccin]]

-- configurations for GUI clients
if vim.g.neovide then
	require 'gui'
end
