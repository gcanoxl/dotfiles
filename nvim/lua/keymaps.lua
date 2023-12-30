-- Remap jk to <ESC>
vim.keymap.set("i", "jk", "<esc>")

-- Use C-i C-o to jump between locations
vim.keymap.set("n", "<C-i>", "<C-]>")

-- Hop
vim.keymap.set("n", "f", geem.cmd("HopChar1"))
vim.keymap.set("n", "F", geem.cmd("HopLine"))

-- Buffers
vim.keymap.set("n", "<C-c>", geem.cmd('lua require("bufdelete").bufdelete(0, false)'))
vim.keymap.set("n", "<C-b>", geem.cmd("Telescope scope buffers"))
vim.keymap.set("n", "{", geem.cmd("BufferLineCyclePrev"))
vim.keymap.set("n", "}", geem.cmd("BufferLineCycleNext"))

-- File
vim.keymap.set("n", "<C-f>", geem.cmd("Telescope find_files"))

-- Emoji
vim.keymap.set("i", "<C-e>", geem.cmd("Telescope emoji"))

-- Smart Splits
vim.keymap.set("n", "<C-S-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-S-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-S-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-S-l>", require("smart-splits").resize_right)
--
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

-- LuaSnip
vim.api.nvim_set_keymap(
	"i",
	"<Tab>",
	[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']],
	{ silent = true, expr = true }
)
vim.keymap.set("i", "<S-Tab>", geem.cmd("lua require'luasnip'.jump(-1)"))
vim.keymap.set("s", "<Tab>", geem.cmd("lua require'luasnip'.jump(1)"))
vim.keymap.set("s", "<S-Tab>", geem.cmd("lua require'luasnip'.jump(-1)"))

local wk = require("which-key")

-- ========================================
-- |        Keymaps with <Leader>         |
-- ========================================
wk.register({
	["<leader>"] = { geem.cmd("Telescope commands"), "Commands" },
	-- Application
	a = {
		name = "Application",
		q = { geem.cmd("quitall"), "Quit" },
		n = { geem.cmd("noh"), "Stop Highlight" },
		j = { geem.cmd("Telescope jumplist"), "Jumplist" },
		s = { geem.cmd("Telescope live_grep"), "Search" },
		h = { geem.cmd("Telescope help_tags"), "Help" },
		c = { geem.cmd("Telescope colorscheme"), "Colorscheme" },
		k = { geem.cmd("Telescope keymaps"), "Keymaps" },
		t = { geem.cmd("TodoTelescope"), "Todo List" },
		e = { geem.cmd("Telescope emoji"), "Emoji" },
		m = { geem.cmd("Telescope notify"), "Messages" },
	},
	-- Config
	c = {
		name = "Config",
		c = { geem.cmd("Neoconf"), "Select Config" },
		l = { geem.cmd("Neoconf local"), "Edit Local Config" },
		g = { geem.cmd("Neoconf global"), "Edit Global Config" },
		s = { geem.cmd("Neoconf show"), "Show Config" },
		p = { geem.cmd("Neoconf lsp"), "Show LSP Config" },
	},
	-- Terminal
	["!"] = { geem.cmd("ToggleTerm"), "Terminal" },
	-- Tab
	t = {
		name = "Tab",
		n = { geem.cmd("tabnew"), "New Empty Tab" },
		c = { geem.cmd("tabclose"), "Close Current Table" },
		-- TODO: implement these two key bindings
		-- o = { geem.cmd("tab split"), "Duplicate to New Table" },
		-- O = { geem.move_buf_to_new_tab, "Move to New Table" },
		t = { require("telescope-tabs").list_tabs, "Tabs" },
		["1"] = { geem.cmd('exec "normal! 1gt"'), "Go to Tab 1" },
		["2"] = { geem.cmd('exec "normal! 2gt"'), "Go to Tab 2" },
		["3"] = { geem.cmd('exec "normal! 3gt"'), "Go to Tab 3" },
		["4"] = { geem.cmd('exec "normal! 4gt"'), "Go to Tab 4" },
		["5"] = { geem.cmd('exec "normal! 5gt"'), "Go to Tab 5" },
		["6"] = { geem.cmd('exec "normal! 6gt"'), "Go to Tab 6" },
		["7"] = { geem.cmd('exec "normal! 7gt"'), "Go to Tab 7" },
		["8"] = { geem.cmd('exec "normal! 8gt"'), "Go to Tab 8" },
		["9"] = { geem.cmd('exec "normal! 9gt"'), "Go to Tab 9" },
	},
	-- Buffer
	b = {
		name = "Buffer",
		b = { geem.cmd("Telescope scope buffers"), "Buffers" },
		B = { geem.cmd("Telescope buffers"), "Tab-local Buffers" },
		o = { geem.cmd("BufferLineCloseOthers"), "Close Other Buffers" },
		h = { geem.cmd("BufferLineCyclePrev"), "Previous Buffer" },
		m = { geem.cmd("ScopeMoveBuf"), "Move to Table" },
		l = { geem.cmd("BufferLineCycleNext"), "Next Buffer" },
		H = { geem.cmd("BufferLineMovePrev"), "Move Left" },
		L = { geem.cmd("BufferLineMoveNext"), "Move Right" },
		p = { geem.cmd("BufferLineTogglePin"), "Pin" },
		P = { geem.cmd("BufferLinePick"), "Pick Buffer" },
		n = { geem.cmd("enew"), "New Buffer" },
		c = {
			function()
				require("bufdelete").bufdelete(0, false)
			end,
			"Close Buffer",
		},
	},
	-- Errors
	e = {
		geem.cmd("TroubleToggle"),
		"Trouble Toggle",
	},
	-- File
	f = {
		name = "File",
		w = { geem.cmd("silent wa"), "Save File" },
		l = { geem.cmd("Neotree"), "File Explorer" },
		r = { geem.cmd("Telescope oldfiles"), "Recent Files" },
		d = { geem.cmd("Dired"), "File Manager" },
	},
	-- Git
	g = {
		g = { require("neogit").open, "Git" },
		s = { geem.cmd("Gitsigns stage_hunk"), "Stage Hunk" },
		S = { geem.cmd("Gitsigns stage_buffer"), "Stage Buffer" },
		u = { geem.cmd("Gitsigns undo_stage_hunk"), "Undo Stage Hunk" },
		d = { geem.cmd("Gitsigns reset_hunk"), "Reset Hunk" },
		n = { geem.cmd("Gitsigns next_hunk"), "Next Hunk" },
		p = { geem.cmd("Gitsigns prev_hunk"), "Previous Hunk" },
		l = { geem.cmd("Neotree git_status"), "Git Status" },
		t = {
			name = "Toggle",
			l = { geem.cmd("Gitsigns toggle_linehl"), "Line Highlight" },
			n = { geem.cmd("Gitsigns toggle_numhl"), "Number Highlight" },
			s = { geem.cmd("Gitsigns toggle_signs"), "Signs" },
		},
	},
	-- Project
	p = {
		name = "Project",
		p = {
			function()
				require("telescope").extensions.projects.projects({})
			end,
			"Projects",
		},
		P = { geem.cmd("ProjectRoot"), "Reset Root Directory" },
		a = { geem.cmd("AddProject"), "Add Project" },
		l = {
			function()
				require("persistence").load()
			end,
			"Load Project",
		},
		t = {
			function()
				require("persistence").stop()
			end,
			"Stop Project",
		},
	},
	-- Package Management
	P = { geem.cmd("Lazy"), "Package Management" },
	-- Debug
	d = {
		name = "Debug",
		b = { require("dap").toggle_breakpoint, "Toggle Breakpoint" },
		c = { require("dap").continue, "Start or Continue" },
		n = { require("dap").step_over, "Step Over" },
		i = { require("dap").step_into, "Step Into" },
		o = { require("dap").step_out, "Step Out" },
		q = { require("dap").terminate, "Terminate" },
		l = { require("dap.repl").toggle, "Toggle REPL" },
		L = { require("dap.repl").clear, "Clear REPL" },
	},
}, { prefix = "<leader>", mode = "n", noremap = true, silent = true })

-- Go Special Keymaps
geem.map_on_filetype("go", {
	a = { geem.cmd("GoAlt"), "Alt" },
	t = {
		name = "Test",
		t = { geem.cmd("GoTest"), "GoTest" },
	},
	c = { geem.cmd("GoCodeAction"), "GoCodeAction", mode = { "n", "v" } },
})

-- Dart Special Keymaps
geem.map_on_filetype("dart", {
	["<localleader>"] = { geem.cmd("Telescope flutter commands"), "Flutter Commands" },
	e = { geem.cmd("FlutterEmulators"), "Emulators" },
	w = { geem.cmd("FlutterOutlineToggle"), "Toggle Widget Outline" },
	r = { geem.cmd("FlutterRun"), "Run Flutter" },
	R = { geem.cmd("FlutterRestart"), "Restart Flutter" },
})

-- Lua Special Keymaps
geem.map_on_filetype("lua", {
	["s"] = { geem.cmd("source %"), "Source" },
	r = { geem.cmd("LuaRun"), "Run Currenet Buffer" },
})

-- Python Special Keymaps
geem.map_on_filetype("python", {
	["r"] = { geem.cmd("RunCode"), "Run" },
})
