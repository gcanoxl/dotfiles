-- auto perform `Fix All` code action on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.dart",
	callback = function()
		vim.lsp.buf.code_action({
			apply = true,
			filter = function(action)
				return action.title == "Fix All"
			end
		})
	end
})
