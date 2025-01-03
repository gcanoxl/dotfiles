-- TODO: refactor lsp configs
local wk_ok, wk = pcall(require, "which-key")

-- on_attach function
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/inlayHint", { bufnr = bufnr }) then
		vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
	end
	-- shortcuts
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "dp", utils.cmd("Lspsaga diagnostic_jump_prev"), bufopts)
	vim.keymap.set("n", "dn", utils.cmd("Lspsaga diagnostic_jump_next"), bufopts)
	vim.keymap.set("n", "K", utils.cmd("Lspsaga hover_doc"), bufopts)
	vim.keymap.set("n", "ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gd", utils.cmd("Lspsaga goto_definition"), bufopts)
	vim.keymap.set("n", "gf", utils.cmd("Lspsaga finder"), bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.api.nvim_buf_set_keymap(
		0,
		"n",
		"go",
		":Telescope lsp_dynamic_workspace_symbols<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(0, "n", "gl", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })

	-- register keymaps using which-key
	if wk_ok then
		wk.register({
			l = {
				name = "LSP",
				n = { vim.lsp.buf.rename, "Rename" },
				o = { utils.cmd("AerialToggle"), "Symbol List" },
				O = { utils.cmd("AerialNavToggle"), "Symbol Navigation" },
				k = { utils.cmd("Lspsaga hover_doc"), "Hover Doc" },
				K = { utils.cmd("Lspsaga hover_doc ++keep"), "Persistent Hover Doc" },
				a = { vim.lsp.buf.code_action, "Code Action" },
				f = { utils.cmd("Lspsaga finder"), "Finder" },
				g = {
					name = "Goto",
					d = { utils.cmd("Lspsaga goto_definition"), "Definition" },
					D = { vim.lsp.buf.type_definition, "Type Definition" },
					i = { vim.lsp.buf.implementation, "Implementation" },
					o = { utils.cmd("Telescope lsp_dynamic_workspace_symbols"), "Workspace Symbols" },
					l = { utils.cmd("Telescope lsp_document_symbols"), "Document Symbols" },
				},
				t = {
					name = "Toggle",
					i = {
						utils.toggles.toggle_inlay_hint,
						"Inlay Hint",
					},
				},
			},
		}, { prefix = "<leader>", buffer = bufnr })
	end
end

-- handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = vim.g.preference.border })
vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, { border = vim.g.preference.border })

return on_attach
