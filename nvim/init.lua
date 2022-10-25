require 'options'
require 'utils'
geem.initialize_packer()
require 'plugins'
require 'keymaps'

-- configurations for GUI clients
if vim.g.neovide then
	require 'gui'
end
