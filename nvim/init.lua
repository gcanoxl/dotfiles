require("core")
require("utils")
require("installer")
require("keymaps")

vim.api.nvim_command([[colorscheme tokyonight-moon]])
-- vim.cmd("colorscheme catppuccin-frappe")

-- configurations for GUI clients
if vim.g.neovide then
	require("gui")
end

-- loading configs
require("configs")
