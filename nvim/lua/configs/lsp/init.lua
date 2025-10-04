local M = {}

M.servers = {
	"lua_ls",
	"vimls",
	"pyright",
	"jsonls",
	"yamlls",
	"ts_ls",
	"html",
	"clangd",
	"postgres_lsp",
}

for _, server in ipairs(M.servers) do
	---@type vim.lsp.Config
	local settings = {
		on_attach = function(client, _)
			vim.cmd("cd " .. client.root_dir)
		end,
		root_markers = { ".project", ".git" },
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
