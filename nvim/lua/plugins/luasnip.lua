-- TODO: verify if it enables
vim.api.nvim_set_keymap('i', '<Tab>',
	[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']],
	{ silent = true, expr = true })
