local peek_avail, peek = pcall(require, 'peek')
if not peek_avail then return end

peek.setup({
	auto_load = true,
	close_on_bdelete = true,
	syntax = true,
	theme = 'light', -- 'dark' or 'light'
	update_on_change = true,
	app = 'browser'
})

vim.api.nvim_buf_create_user_command(0, 'PeekOpen', require('peek').open, {})
vim.api.nvim_buf_create_user_command(0, 'PeekClose', require('peek').close, {})
