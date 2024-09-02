local group = vim.api.nvim_create_augroup("treesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = "*",
	callback = function()
		vim.schedule(function()
			pcall(vim.treesitter.start)
		end)
	end,
})
