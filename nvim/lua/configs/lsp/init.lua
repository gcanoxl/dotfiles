local M = {}

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

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(M.servers) do
	local settings = {
		capabilities = capabilities,
		-- on_attach = on_attach,
	}

	local path = vim.fn.stdpath("config") .. "/lua/configs/lsp/servers/" .. server .. ".lua"
	if vim.fn.filereadable(path) == 1 then
		local ok, custom_settings = pcall(require, "configs.lsp.servers." .. server)
		if ok then
			settings = vim.tbl_deep_extend("force", settings, custom_settings or {}) or {}
		end
	end

	vim.lsp.config(server, settings)
	vim.lsp.enable(server)
end

return M
