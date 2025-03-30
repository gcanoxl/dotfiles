-- TODO: refactor lsp configs
local wk_ok, wk = pcall(require, "which-key")

-- on_attach function
local on_attach = function(client, bufnr) end

-- handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = vim.g.preference.border })
vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, { border = vim.g.preference.border })

return on_attach
