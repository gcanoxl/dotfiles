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

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		capabilities = capabilities,
	}
end

-- auto format on save
vim.cmd [[
augroup formatOnSave
    autocmd!
    autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting_sync()
augroup END
]]

-- lua remove annoying warnings
lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
