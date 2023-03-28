-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.keymap.set('i', 'jk', '<esc>')

-- Hop
vim.keymap.set('n', 'f', geem.cmd('HopChar1'))
vim.keymap.set('n', 'F', geem.cmd('HopLine'))

-- Buffers
vim.keymap.set('n', '<C-c>', geem.cmd('lua require("bufdelete").bufdelete(0, false)'))
vim.keymap.set('n', '<C-b>', geem.cmd('Telescope buffers'))

-- File
vim.keymap.set('n', '<C-f>', geem.cmd('Telescope find_files'))

-- Terminal
vim.keymap.set('n', '!', geem.cmd('ToggleTerm'))

-- Emoji
vim.keymap.set('i', '<C-e>', geem.cmd('Telescope emoji'))

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

-- LuaSnip
vim.api.nvim_set_keymap('i', '<Tab>',
	[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']],
	{ silent = true, expr = true })
vim.keymap.set('i', "<S-Tab>", geem.cmd("lua require'luasnip'.jump(-1)"))
vim.keymap.set('s', "<Tab>", geem.cmd("lua require'luasnip'.jump(1)"))
vim.keymap.set('s', "<S-Tab>", geem.cmd("lua require'luasnip'.jump(-1)"))

local wk = require("which-key")

-- ========================================
-- |        Keymaps with <Leader>         |
-- ========================================
wk.register(
	{
		['<leader>'] = { geem.cmd('Telescope commands'), 'Commands' },
		-- Application
		a = {
			name = "Application",
			q = { geem.cmd("quitall"), "Quit" },
			n = { geem.cmd("noh"), "Stop Highlight" },
			j = { geem.cmd("Telescope jumplist"), "Jumplist" },
			s = { geem.cmd("Telescope live_grep"), 'Search' },
			h = { geem.cmd("Telescope help_tags"), 'Help' },
			c = { geem.cmd("Telescope colorscheme"), 'Colorscheme' },
			k = { geem.cmd("Telescope keymaps"), "Keymaps" },
			t = { geem.cmd("TodoTelescope"), "Todo List" },
			e = { geem.cmd('Telescope emoji'), 'Emoji' },
			m = { geem.cmd('Telescope notify'), 'Messages' }
		},
		-- File
		f = {
			name = "File",
			w = { geem.cmd("wa"), "Save File" },
			l = { geem.cmd("Neotree"), "File Explore" },
			r = { geem.cmd("Telescope oldfiles"), "Recent Files" },
		},
		-- Git
		g = { function() require('neogit').open() end, "Git" },
		-- Project
		p = {
			name = "Project",
			r = { geem.cmd("SessionManager load_last_session"), "Load Last Session" },
			f = { geem.cmd("SessionManager load_session"), "Find Session" },
			s = { geem.cmd("SessionManager save_current_session"), "Save Session" },
			d = { geem.cmd("SessionManager delete_session"), "Delete Session" },
		},
		-- Package Management
		P = { geem.cmd("Lazy"), "Package Management" },
	},
	{ prefix = "<leader>", }
)

-- Go Special Keymaps
geem.map_on_filetype('go', {
	a = { geem.cmd('GoAlt'), 'Alt' }
	,
	t = {
		name = "Test",
		t = { geem.cmd("GoTest"), 'GoTest' }
	}
})

-- Dart Special Keymaps
geem.map_on_filetype('dart', {
	['<localleader>'] = { geem.cmd('Telescope flutter commands'), "Flutter Commands" },
	e = { geem.cmd('FlutterEmulators'), 'Emulators' },
	w = { geem.cmd('FlutterOutlineToggle'), 'Toggle Widget Outline' },
})
