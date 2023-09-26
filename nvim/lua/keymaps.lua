-- Remap jk to <ESC>
vim.keymap.set('i', 'jk', '<esc>')

-- Use C-i C-o to jump between locations
vim.keymap.set('n', '<C-i>', '<C-]>')

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
vim.keymap.set('t', 'jk', '<C-\\><C-n>')

-- Emoji
vim.keymap.set('i', '<C-e>', geem.cmd('Telescope emoji'))

-- Tabs
vim.keymap.set('n', '{', geem.cmd('tabprevious'))
vim.keymap.set('n', '}', geem.cmd('tabnext'))

-- Smart Splits
vim.keymap.set('n', '<C-S-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-S-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-S-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-S-l>', require('smart-splits').resize_right)
--
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
		-- Tab
		t = {
			name = "Tab",
			n = { geem.cmd('tabnew'), 'New Empty Tab', },
			c = { geem.cmd('tabclose'), 'Close Current Table' },
			o = { geem.cmd('tab split'), 'Duplicate to New Table' },
			O = { geem.move_to_new_tab, 'Move to New Table', },
			t = { require('telescope-tabs').list_tabs, 'Tabs' },
		},
		-- Buffer
		b = {
			name = "Buffer",
			b = {
				geem.cmd('Telescope buffers'), 'Buffers'
			},
		},
		-- Errors
		e = {
			geem.cmd("TroubleToggle"), "Trouble Toggle"
		},
		-- File
		f = {
			name = "File",
			w = { geem.cmd("wa"), "Save File" },
			l = { geem.cmd("Neotree"), "File Explorer" },
			r = { geem.cmd("Telescope oldfiles"), "Recent Files" },
			d = { geem.cmd('Dired'), 'File Manager' },
		},
		-- Git
		g = { require('neogit').open, "Git" },
		-- Project
		p = {
			name = "Project",
			p = { function() require 'telescope'.extensions.projects.projects {} end, 'Projects', },
			P = { geem.cmd('ProjectRoot'), 'Reset Root Directory', },
			a = { geem.cmd('ProjectAdd'), 'Add Project' },
		},
		-- Package Management
		P = { geem.cmd("Lazy"), "Package Management" },
		-- Debug
		d = {
			name = "Debug",
			b = { require('dap').toggle_breakpoint, "Toggle Breakpoint" },
			c = { require('dap').continue, "Start or Continue" },
			u = { require('dapui').toggle, "Toggle Dap UI" },
			n = { require('dap').step_over, "Step Over" },
			i = { require('dap').step_into, "Step Into" },
			o = { require('dap').step_out, "Step Out" },
			q = { require('dap').terminate, "Terminate" },
			l = { require('dap.repl').clear, "Clear REPL" },
		}
	},
	{ prefix = "<leader>", }
)

-- Go Special Keymaps
geem.map_on_filetype('go', {
	a = { geem.cmd('GoAlt'), 'Alt' },
	t = {
		name = "Test",
		t = { geem.cmd("GoTest"), 'GoTest' }
	},
	c = { geem.cmd("GoCodeAction"), 'GoCodeAction', mode = { 'n', 'v' } },
})

-- Dart Special Keymaps
geem.map_on_filetype('dart', {
	['<localleader>'] = { geem.cmd('Telescope flutter commands'), "Flutter Commands" },
	e = { geem.cmd('FlutterEmulators'), 'Emulators' },
	w = { geem.cmd('FlutterOutlineToggle'), 'Toggle Widget Outline' },
	r = { geem.cmd('FlutterRun'), 'Run Flutter' },
})

-- Lua Special Keymaps
geem.map_on_filetype('lua', {
	['s'] = { geem.cmd('source %'), 'Source' },
	r = { geem.cmd('LuaRun'), 'Run Currenet Buffer' },
})

-- Python Special Keymaps
geem.map_on_filetype('python', {
	['r'] = { geem.cmd('RunCode'), 'Run' }
})
