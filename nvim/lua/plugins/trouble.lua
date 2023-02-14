local trouble_avail, trouble = pcall(require, 'trouble')
if not trouble_avail then return end

trouble.setup {
	-- auto_open = true, -- automatically open the list when you have diagnostics
	auto_close = true,
}
