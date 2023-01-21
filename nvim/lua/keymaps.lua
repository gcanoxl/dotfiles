-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- General
geem.map_i('jk', '<ESC>')
geem.map_ncl('fw', 'wa')
geem.map_ncl('qq', 'quitall')
geem.map_ncl('nh', 'noh')

-- Packer
geem.map_ncl('pi', 'PackerInstall')
geem.map_ncl('pc', 'PackerCompile')
geem.map_ncl('pC', 'PackerClean')
geem.map_ncl('pu', 'PackerSync')
geem.map_ncl('pl', 'PackerStatus')

-- Hop
geem.map_nc('f', 'HopChar1')
geem.map_nc('F', 'HopLine')
geem.map_vc('F', 'HopLine')

-- Neo Tree
geem.map_ncl('fl', 'Neotree')

-- Neogit
geem.map_ncl('gg', "lua require('neogit').open()")

-- SessionManager
geem.map_ncl('pR', 'SessionManager load_last_session')
geem.map_ncl('pf', 'SessionManager load_session')
geem.map_ncl('ps', 'SessionManager save_current_session')
geem.map_ncl('pd', 'SessionManager delete_session')

-- Bufdelete
geem.map_nc('<C-c>', 'lua require("bufdelete").bufdelete(0, false)')

-- Telescope
geem.map_nc('<C-b>', 'Telescope buffers')
geem.map_ncl('<leader>', 'Telescope commands')
-- geem.map_ncl('bb', 'Telescope buffers')
geem.map_nc('<C-f>', 'Telescope find_files')
geem.map_ncl('fr', 'Telescope oldfiles')
geem.map_ncl('ss', 'Telescope live_grep')
geem.map_ncl('hh', 'Telescope help_tags')
geem.map_ncl('tc', 'Telescope colorscheme')

-- TodoList
geem.map_ncl('ts', 'TodoTelescope')
geem.map_ncl('tt', 'TodoQuickFix')

-- Terminal
geem.map_nc('!', 'ToggleTerm')

-- LuaSnip
vim.api.nvim_set_keymap('i', '<Tab>',
	[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']],
	{ silent = true, expr = true })
geem.map_ic("<S-Tab>", "lua require'luasnip'.jump(-1)")
geem.map_sc("<Tab>", "lua require'luasnip'.jump(1)")
geem.map_sc("<S-Tab>", "lua require'luasnip'.jump(-1)")

-- Smart Splits
vim.keymap.set('n', '<C-w>h', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-w>j', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-w>k', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-w>l', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

-- END
geem.map_mappings()
