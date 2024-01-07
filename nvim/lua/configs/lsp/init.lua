local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

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
	float = {
		border = vim.g.preference.border,
	},
})

-- enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "lua_ls", "vimls", "pyright", "gopls", "clangd", "jsonls", "yamlls" }

local on_attach = require("configs.lsp.handlers")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
	local settings = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
	lspconfig[server].setup(settings)
end
