local swift_group = vim.api.nvim_create_augroup("swift_group", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = swift_group,
	pattern = "*.swift",
	callback = function()
		vim.defer_fn(function()
			vim.schedule(function()
				vim.cmd.checktime()
			end)
		end, 1000)
	end,
})
