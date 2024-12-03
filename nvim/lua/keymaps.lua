-- Remap jk to <ESC>
vim.keymap.set("i", "jk", "<esc>")

-- Use C-i C-o to jump between locations
vim.keymap.set("n", "<C-i>", "<C-]>")

-- Fold
vim.keymap.set("n", "<tab>", "za")

-- Buffers
vim.keymap.set("n", "<C-c>", util.cmd('lua require("bufdelete").bufdelete(0, false)'))
vim.keymap.set("n", "<C-b>", util.cmd("Telescope scope buffers"))
vim.keymap.set("n", "{", util.cmd("BufferLineCyclePrev"))
vim.keymap.set("n", "}", util.cmd("BufferLineCycleNext"))

-- File
vim.keymap.set("n", "<C-f>", util.cmd("Telescope find_files"))

-- Emoji
vim.keymap.set("i", "<C-e>", util.cmd("Telescope emoji"))

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
vim.keymap.set("i", "<S-Tab>", util.cmd("lua require'luasnip'.jump(-1)"))
vim.keymap.set("s", "<Tab>", util.cmd("lua require'luasnip'.jump(1)"))
vim.keymap.set("s", "<S-Tab>", util.cmd("lua require'luasnip'.jump(-1)"))

local wk = require("which-key")

-- ========================================
-- |        Keymaps with <Leader>         |
-- ========================================
wk.register({
	["<leader>"] = { util.cmd("Telescope commands"), "Commands" },
	-- Application
	a = {
		name = "Application",
		q = { util.cmd("quitall"), "Quit" },
		n = { util.cmd("noh"), "Stop Highlight" },
		j = { util.cmd("Telescope jumplist"), "Jumplist" },
		s = { util.cmd("Telescope live_grep"), "Search" },
		h = { util.cmd("Telescope help_tags"), "Help" },
		c = { util.cmd("Telescope colorscheme"), "Colorscheme" },
		k = { util.cmd("Telescope keymaps"), "Keymaps" },
		t = { util.cmd("TodoTelescope"), "Todo List" },
		e = { util.cmd("Telescope emoji"), "Emoji" },
		m = { util.cmd("Telescope notify"), "Messages" },
	},
	-- Config
	c = {
		name = "Config",
		c = { util.cmd("Neoconf"), "Select Config" },
		l = { util.cmd("Neoconf local"), "Edit Local Config" },
		g = { util.cmd("Neoconf global"), "Edit Global Config" },
		s = { util.cmd("Neoconf show"), "Show Config" },
		p = { util.cmd("Neoconf lsp"), "Show LSP Config" },
	},
	-- Terminal
	["!"] = { util.cmd("ToggleTerm"), "Terminal" },
	-- Tab
	t = {
		name = "Tab",
		n = { util.cmd("tabnew"), "New Empty Tab" },
		c = { util.cmd("tabclose"), "Close Current Table" },
		t = { require("telescope-tabs").list_tabs, "Tabs" },
		["1"] = { util.cmd('exec "normal! 1gt"'), "Go to Tab 1" },
		["2"] = { util.cmd('exec "normal! 2gt"'), "Go to Tab 2" },
		["3"] = { util.cmd('exec "normal! 3gt"'), "Go to Tab 3" },
		["4"] = { util.cmd('exec "normal! 4gt"'), "Go to Tab 4" },
		["5"] = { util.cmd('exec "normal! 5gt"'), "Go to Tab 5" },
		["6"] = { util.cmd('exec "normal! 6gt"'), "Go to Tab 6" },
		["7"] = { util.cmd('exec "normal! 7gt"'), "Go to Tab 7" },
		["8"] = { util.cmd('exec "normal! 8gt"'), "Go to Tab 8" },
		["9"] = { util.cmd('exec "normal! 9gt"'), "Go to Tab 9" },
	},
	-- Buffer
	b = {
		name = "Buffer",
		b = { util.cmd("Telescope scope buffers"), "Buffers" },
		B = { util.cmd("Telescope buffers"), "Tab-local Buffers" },
		o = { util.cmd("BufferLineCloseOthers"), "Close Other Buffers" },
		h = { util.cmd("BufferLineCyclePrev"), "Previous Buffer" },
		m = { util.cmd("ScopeMoveBuf"), "Move to Table" },
		l = { util.cmd("BufferLineCycleNext"), "Next Buffer" },
		H = { util.cmd("BufferLineMovePrev"), "Move Left" },
		L = { util.cmd("BufferLineMoveNext"), "Move Right" },
		p = { util.cmd("BufferLineTogglePin"), "Pin" },
		P = { util.cmd("BufferLinePick"), "Pick Buffer" },
		n = { util.cmd("enew"), "New Buffer" },
		c = {
			function()
				require("bufdelete").bufdelete(0, false)
			end,
			"Close Buffer",
		},
	},
	-- Errors
	e = {
		util.cmd("TroubleToggle"),
		"Trouble Toggle",
	},
	-- File
	f = {
		name = "File",
		w = { util.cmd("silent wa"), "Save File" },
		l = { util.cmd("Neotree"), "File Explorer" },
		r = { util.cmd("Telescope oldfiles"), "Recent Files" },
		d = { util.cmd("Dired"), "File Manager" },
	},
	-- Window
	w = {
		name = "Window",
		a = {
			name = "Auto Resize",
			t = { util.cmd("WindowsToggleAutowidth"), "Toggle Auto Width" },
			e = { util.cmd("WindowsEqualize"), "Equalize Width" },
			m = { util.cmd("WindowsMaximize"), "Maximize Width" },
		},
	},
	-- Git
	g = {
		g = { require("neogit").open, "Git" },
		G = {
			function()
				util.lazygit:open()
			end,
			"Git",
		},
		s = { util.cmd("Gitsigns stage_hunk"), "Stage Hunk" },
		S = { util.cmd("Gitsigns stage_buffer"), "Stage Buffer" },
		u = { util.cmd("Gitsigns undo_stage_hunk"), "Undo Stage Hunk" },
		x = { util.cmd("Gitsigns reset_hunk"), "Reset Hunk" },
		d = {
			name = "Diff",
			d = { util.cmd("Gitsigns diffthis"), "Diff This" },
			c = { util.cmd("DiffviewClose"), "Close Diff" },
			f = { util.cmd("DiffviewFileHistory %"), "Current File History" },
			t = { util.cmd("DiffviewToggleFiles"), "Toggle Files" },
		},
		n = { util.cmd("Gitsigns next_hunk"), "Next Hunk" },
		p = { util.cmd("Gitsigns prev_hunk"), "Previous Hunk" },
		l = { util.cmd("Neotree git_status"), "Git Status" },
		t = {
			name = "Toggle",
			l = { util.cmd("Gitsigns toggle_linehl"), "Line Highlight" },
			n = { util.cmd("Gitsigns toggle_numhl"), "Number Highlight" },
			s = { util.cmd("Gitsigns toggle_signs"), "Signs" },
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
		P = { util.cmd("ProjectRoot"), "Reset Root Directory" },
		a = { util.cmd("AddProject"), "Add Project" },
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
	P = { util.cmd("Lazy"), "Package Management" },
	-- Debug
	d = {
		name = "Debug",
		s = {
			function()
				require("osv").launch({ port = 8086 })
			end,
			"Start Debug Server",
		},
		b = { require("dap").toggle_breakpoint, "Toggle Breakpoint" },
		u = { require("dapui").toggle, "Toggle DAP UI" },
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
util.map_on_filetype("go", {
	a = { util.cmd("GoAlt"), "Alt" },
	t = {
		name = "Test",
		t = { util.cmd("GoTest"), "GoTest" },
	},
	c = { util.cmd("GoCodeAction"), "GoCodeAction", mode = { "n", "v" } },
})

-- Dart Special Keymaps
util.map_on_filetype("dart", {
	["<localleader>"] = { util.cmd("Telescope flutter commands"), "Flutter Commands" },
	e = { util.cmd("FlutterEmulators"), "Emulators" },
	w = { util.cmd("FlutterOutlineToggle"), "Toggle Widget Outline" },
	r = { util.cmd("FlutterRun"), "Run Flutter" },
	R = { util.cmd("FlutterRestart"), "Restart Flutter" },
	M = {
		function()
			vim.lsp.buf.code_action({
				apply = true,
				filter = function(action)
					return action.title == "Extract Method"
				end,
			})
		end,
		"Extract Method",
	},
	W = {
		function()
			vim.lsp.buf.code_action({
				apply = true,
				filter = function(action)
					return action.title == "Extract Widget"
				end,
			})
		end,
		"Extract Method",
	},
	L = {
		function()
			vim.lsp.buf.code_action({
				apply = true,
				filter = function(action)
					return action.title == "Extract Local Variable"
				end,
			})
		end,
		"Extract Method",
	},
	A = {
		function()
			vim.lsp.buf.code_action({
				apply = true,
				filter = function(action)
					return action.title == "Wrap with widget..."
				end,
			})
		end,
		"Extract Method",
	},
})

-- Lua Special Keymaps
util.map_on_filetype("lua", {
	["s"] = { util.cmd("source %"), "Source" },
	r = { util.cmd("LuaRun"), "Run Currenet Buffer" },
})

-- Python Special Keymaps
util.map_on_filetype("python", {
	["r"] = { util.cmd("RunCode"), "Run" },
})
