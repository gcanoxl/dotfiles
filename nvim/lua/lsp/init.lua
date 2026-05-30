-- Load configs
local configs_dir = vim.fn.stdpath('config') .. '/lua/lsp/configs'
if vim.uv.fs_stat(configs_dir) == nil then
	vim.notify('The LSP Configuration folder does not exist!', vim.log.levels.WARN)
end

local ensure_installs = {}
for file,_ in vim.fs.dir(configs_dir) do
	local module_name = vim.fn.fnamemodify(file, ':r')
	local config = require('lsp.configs.'..module_name)
	vim.lsp.config(module_name, config)
	vim.lsp.enable({module_name})
	table.insert(ensure_installs, config.cmd)
end

-- Install executables
vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = ensure_installs,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
