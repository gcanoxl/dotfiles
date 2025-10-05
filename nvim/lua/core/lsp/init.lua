for _, server in ipairs(core.configs.lsp.servers) do
	---@type vim.lsp.Config
	local settings = {
		on_attach = function(client, _)
			vim.cmd.cd(client.root_dir)
		end,
		root_markers = core.configs.root_markers,
	}

	local ok, custom_settings = pcall(require, "core.lsp.servers." .. server)
	if ok then
		settings = vim.tbl_deep_extend("force", settings, custom_settings or {}) or {}
	end

	vim.lsp.config(server, settings)
	vim.lsp.enable(server)
end
