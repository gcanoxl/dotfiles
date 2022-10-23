local cmp_lsp_status_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_status_ok then
	return
end

-- on_attach function
local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'go', ':Telescope lsp_dynamic_workspace_symbols<CR>',
		{ noremap = true, silent = true })
end

-- handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = vim.g.preference.border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
	{ border = vim.g.preference.border })

-- capabilities
local capabilities = cmp_lsp.default_capabilities()

return on_attach, capabilities
