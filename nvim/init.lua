require("options")
require("utils")
require("installer")
require("keymaps")
require("autocmds")

-- vim.api.nvim_command([[colorscheme tokyonight-moon]])
vim.cmd("colorscheme onedark")

-- configurations for GUI clients
if vim.g.neovide then
	require("gui")
end

-- loading configs
require("configs")
