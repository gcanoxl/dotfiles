local augroup = vim.api.nvim_create_augroup("qf", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	group = augroup,
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_set_option_value("buflisted", false, { scope = "local", buf = buf })
	end,
})
return {
	"stevearc/overseer.nvim",
	opts = {
		templates = { "builtin", "user.oi_run" },
		task_list = {
			direction = "right",
		},
	},
}
