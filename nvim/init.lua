-- TODO: cmd keymaps
-- TODO: toggleterm
-- TODO: add lazygit support
-- TODO: dap
require("options")
require("utils")
require("plugin")
require("keymaps")
require("autocmds")

vim.api.nvim_command([[colorscheme tokyonight]])

-- configurations for GUI clients
if vim.g.neovide then
	require("gui")
end
