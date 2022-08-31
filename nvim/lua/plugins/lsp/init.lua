local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then return end

-- define icons
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = { active = signs },
	update_in_insert = true,
})

-- enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'sumneko_lua', 'vimls', 'pyright', 'gopls' }

local capabilities = require 'plugins.lsp.handlers'

-- on_attach function
local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', '<localleader>r', vim.lsp.buf.rename, bufopts)
end

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
