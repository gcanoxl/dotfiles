local cmp_lsp_status_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_status_ok then
	return
end

-- on_attach function
local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', '<localleader>r', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<localleader>dp', vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set('n', '<localleader>dn', vim.diagnostic.goto_next, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, bufopts)
end

-- handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = vim.g.preference.border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
	{ border = vim.g.preference.border })

-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)

return on_attach, capabilities
