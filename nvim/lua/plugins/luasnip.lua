local avali, _ = pcall(require, 'luasnip')
if not avali then return end

vim.api.nvim_set_keymap('i', '<Tab>',
	[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']],
	{ silent = true, expr = true })
geem.map_ic('<S-Tab>', [[lua require'luasnip'.jump(-1)]])
geem.map_sc('<Tab>', [[lua require'luasnip'.jump(1)]])
geem.map_sc('<S-Tab>', [[lua require'luasnip'.jump(-1)]])
