require 'options'
require 'utils'
geem.initialize_packer()
require 'plugins'
require 'keymaps'

vim.g.catppuccin_flavour = "frappe"
vim.cmd [[colorscheme catppuccin]]

-- configurations for GUI clients
if vim.g.neovide then
	require 'gui'
end
