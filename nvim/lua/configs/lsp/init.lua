local M = {}
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
M.servers = {
	"lua_ls",
	"vimls",
	"pyright",
	"jsonls",
	"yamlls",
	"gopls",
	"ts_ls",
	"html",
	"clangd",
	"sourcekit",
	"postgres_lsp",
}

local on_attach = require("configs.lsp.handlers")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(M.servers) do
	local settings = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	local path = vim.fn.stdpath("config") .. "/lua/configs/lsp/servers/" .. server .. ".lua"
	if vim.fn.filereadable(path) == 1 then
		local ok, custom_settings = pcall(require, "configs.lsp.servers." .. server)
		if ok then
			settings = vim.tbl_deep_extend("force", settings, custom_settings or {}) or {}
		end
	end

	lspconfig[server].setup(settings)
end

return M
