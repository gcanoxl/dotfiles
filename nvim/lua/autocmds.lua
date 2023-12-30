local usergroup = vim.api.nvim_create_augroup("usergroup", { clear = true })

-- auto perform `Fix All` code action on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.dart",
	group = "usergroup",
	callback = function()
		vim.lsp.buf.code_action({
			apply = true,
			filter = function(action)
				return action.title == "Fix All"
			end,
		})
	end,
})

-- Auto Cd to current dir when opening a single file in command line
vim.api.nvim_create_autocmd("VimEnter", {
	group = "usergroup",
	callback = function()
		if vim.fn.argc() == 1 then
			local filename = vim.fn.expand("%:p")
			if vim.fn.filereadable(filename) == 1 then
				vim.cmd("cd " .. vim.fn.fnamemodify(filename, ":h"))
			end
		end
	end,
})
