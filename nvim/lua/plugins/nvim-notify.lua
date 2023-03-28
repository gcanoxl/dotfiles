local notify_ok, notify = pcall(require, 'notify')
if not notify_ok then
	return
end

notify.setup({
	top_down = false,
	max_width = 80,
})

vim.notify = notify

local telescope_ok, telescope = pcall(require, 'telescope')
if telescope_ok then
	telescope.load_extension("notify")
end
