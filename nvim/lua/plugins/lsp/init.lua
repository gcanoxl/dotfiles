local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then return end

-- enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'sumneko_lua', 'vimls', 'pyright', 'gopls' }

local on_attach, capabilities = require 'plugins.lsp.handlers'

for _, server in ipairs(servers) do
	local server_config_path = 'plugins.lsp.server-settings.' .. server
	local settings_avail, server_settings = pcall(require, server_config_path)
	local settings = {
		capabilities = capabilities,
		on_attach = on_attach
	}
	if settings_avail then
		for k, v in pairs(server_settings) do
			settings[k] = v
		end
	end

	lspconfig[server].setup(settings)
end

-- auto format on save
vim.cmd [[
augroup formatOnSave
    autocmd!
    autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting_sync()
augroup END
]]
