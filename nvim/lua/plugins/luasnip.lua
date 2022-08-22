local avali, _ = pcall(require, 'luasnip')
local loader_avail, loader = pcall(require, "luasnip/loaders/from_vscode")
if not (avali and loader_avail) then return end

-- load snippets
loader.lazy_load()

vim.api.nvim_set_keymap('i', '<Tab>',
	[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']],
	{ silent = true, expr = true })
geem.map_ic('<S-Tab>', [[lua require'luasnip'.jump(-1)]])
geem.map_sc('<Tab>', [[lua require'luasnip'.jump(1)]])
geem.map_sc('<S-Tab>', [[lua require'luasnip'.jump(-1)]])
