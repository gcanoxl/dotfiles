local cmp_lsp_status_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_status_ok then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)
return capabilities
