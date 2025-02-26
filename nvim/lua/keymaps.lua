-- Remap jk to <ESC>
vim.keymap.set("i", "jk", "<esc>")

-- Use C-i C-o to jump between locations
vim.keymap.set("n", "<C-i>", "<C-]>")

-- Fold
vim.keymap.set("n", "<tab>", "za")

-- Buffers
vim.keymap.set("n", "<C-c>", utils.bufdelete.delete)
vim.keymap.set("n", "<C-b>", utils.cmd("Telescope scope buffers"))
vim.keymap.set("n", "{", utils.cmd("BufferLineCyclePrev"))
vim.keymap.set("n", "}", utils.cmd("BufferLineCycleNext"))

-- Tabs
vim.keymap.set("n", "<C-[>", utils.cmd("tabprevious"))
vim.keymap.set("n", "<C-]>", utils.cmd("tabnext"))

-- File
vim.keymap.set("n", "<C-f>", utils.cmd("Telescope find_files"))

-- Emoji
vim.keymap.set("i", "<C-e>", utils.cmd("Telescope emoji"))

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
vim.keymap.set("i", "<S-Tab>", utils.cmd("lua require'luasnip'.jump(-1)"))
vim.keymap.set("s", "<Tab>", utils.cmd("lua require'luasnip'.jump(1)"))
vim.keymap.set("s", "<S-Tab>", utils.cmd("lua require'luasnip'.jump(-1)"))

local wk = require("which-key")

-- ========================================
-- |        Keymaps with <Leader>         |
-- ========================================
wk.register({
	["<leader>"] = { utils.cmd("Telescope commands"), "Commands" },
	-- Application
	a = {
		name = "Application",
		q = { utils.cmd("quitall"), "Quit" },
		n = { utils.cmd("noh"), "Stop Highlight" },
		j = { utils.cmd("Telescope jumplist"), "Jumplist" },
		s = { utils.cmd("Telescope live_grep"), "Search" },
		h = { utils.cmd("Telescope help_tags"), "Help" },
		c = { utils.cmd("Telescope colorscheme"), "Colorscheme" },
		k = { utils.cmd("Telescope keymaps"), "Keymaps" },
		t = { utils.cmd("TodoTelescope"), "Todo List" },
		e = { utils.cmd("Telescope emoji"), "Emoji" },
		m = { utils.cmd("Telescope notify"), "Messages" },
	},
	-- Config
	c = {
		c = { utils.config_files, "Edit Config" },
	},
	C = {
		name = "Neoconf",
		c = { utils.cmd("Neoconf"), "Select Config" },
		l = { utils.cmd("Neoconf local"), "Edit Local Config" },
		g = { utils.cmd("Neoconf global"), "Edit Global Config" },
		s = { utils.cmd("Neoconf show"), "Show Config" },
		p = { utils.cmd("Neoconf lsp"), "Show LSP Config" },
	},
	-- Terminal
	["!"] = {
		function()
			local term = utils.term.new("echo success")
			term:toggle()
		end,
		"Open Terminal",
	},
	-- Tab
	t = {
		name = "Tab",
		n = { utils.cmd("tabnew"), "New Empty Tab" },
		c = { utils.cmd("tabclose"), "Close Current Table" },
		t = { require("telescope-tabs").list_tabs, "Tabs" },
		["1"] = { utils.cmd('exec "normal! 1gt"'), "Go to Tab 1" },
		["2"] = { utils.cmd('exec "normal! 2gt"'), "Go to Tab 2" },
		["3"] = { utils.cmd('exec "normal! 3gt"'), "Go to Tab 3" },
		["4"] = { utils.cmd('exec "normal! 4gt"'), "Go to Tab 4" },
		["5"] = { utils.cmd('exec "normal! 5gt"'), "Go to Tab 5" },
		["6"] = { utils.cmd('exec "normal! 6gt"'), "Go to Tab 6" },
		["7"] = { utils.cmd('exec "normal! 7gt"'), "Go to Tab 7" },
		["8"] = { utils.cmd('exec "normal! 8gt"'), "Go to Tab 8" },
		["9"] = { utils.cmd('exec "normal! 9gt"'), "Go to Tab 9" },
	},
	-- Buffer
	b = {
		name = "Buffer",
		b = { utils.cmd("Telescope scope buffers"), "Buffers" },
		B = { utils.cmd("Telescope buffers"), "Tab-local Buffers" },
		o = { utils.cmd("BufferLineCloseOthers"), "Close Other Buffers" },
		h = { utils.cmd("BufferLineCyclePrev"), "Previous Buffer" },
		m = { utils.cmd("ScopeMoveBuf"), "Move to Table" },
		l = { utils.cmd("BufferLineCycleNext"), "Next Buffer" },
		H = { utils.cmd("BufferLineMovePrev"), "Move Left" },
		L = { utils.cmd("BufferLineMoveNext"), "Move Right" },
		p = { utils.cmd("BufferLineTogglePin"), "Pin" },
		P = { utils.cmd("BufferLinePick"), "Pick Buffer" },
		n = { utils.cmd("enew"), "New Buffer" },
		c = { utils.bufdelete.delete, "Close Buffer" },
	},
	-- Errors
	e = {
		name = "Diagostic",
		e = { utils.cmd("Trouble errors toggle"), "Errors" },
		p = { utils.cmd("Lspsaga diagnostic_jump_prev"), "Previous" },
		n = { utils.cmd("Lspsaga diagnostic_jump_next"), "Next" },
	},
	-- File
	f = {
		name = "File",
		w = { utils.cmd("silent wa"), "Save File" },
		l = { utils.cmd("Neotree"), "File Explorer" },
		r = { utils.cmd("Telescope oldfiles"), "Recent Files" },
		d = { utils.cmd("Dired"), "File Manager" },
	},
	-- Window
	w = {
		name = "Window",
		a = {
			name = "Auto Resize",
			t = { utils.cmd("WindowsToggleAutowidth"), "Toggle Auto Width" },
			e = { utils.cmd("WindowsEqualize"), "Equalize Width" },
			m = { utils.cmd("WindowsMaximize"), "Maximize Width" },
		},
	},
	-- Git
	g = {
		g = { require("neogit").open, "Git" },
		G = {
			function()
				utils.lazygit:open()
			end,
			"Git",
		},
		s = { utils.cmd("Gitsigns stage_hunk"), "Stage Hunk" },
		S = { utils.cmd("Gitsigns stage_buffer"), "Stage Buffer" },
		u = { utils.cmd("Gitsigns undo_stage_hunk"), "Undo Stage Hunk" },
		x = { utils.cmd("Gitsigns reset_hunk"), "Reset Hunk" },
		d = {
			name = "Diff",
			d = { utils.cmd("Gitsigns diffthis"), "Diff This" },
			c = { utils.cmd("DiffviewClose"), "Close Diff" },
			f = { utils.cmd("DiffviewFileHistory %"), "Current File History" },
			t = { utils.cmd("DiffviewToggleFiles"), "Toggle Files" },
		},
		n = { utils.cmd("Gitsigns next_hunk"), "Next Hunk" },
		p = { utils.cmd("Gitsigns prev_hunk"), "Previous Hunk" },
		l = { utils.cmd("Neotree git_status"), "Git Status" },
		t = {
			name = "Toggle",
			l = { utils.cmd("Gitsigns toggle_linehl"), "Line Highlight" },
			n = { utils.cmd("Gitsigns toggle_numhl"), "Number Highlight" },
			s = { utils.cmd("Gitsigns toggle_signs"), "Signs" },
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
		P = { utils.cmd("ProjectRoot"), "Reset Root Directory" },
		a = { utils.cmd("AddProject"), "Add Project" },
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
	P = { utils.cmd("Lazy"), "Package Management" },
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
utils.map_on_filetype("go", {
	a = { utils.cmd("GoAlt"), "Alt" },
	t = {
		name = "Test",
		t = { utils.cmd("GoTest"), "GoTest" },
	},
	c = { utils.cmd("GoCodeAction"), "GoCodeAction", mode = { "n", "v" } },
})

-- Dart Special Keymaps
utils.map_on_filetype("dart", {
	["<localleader>"] = { utils.cmd("Telescope flutter commands"), "Flutter Commands" },
	e = { utils.cmd("FlutterEmulators"), "Emulators" },
	w = { utils.cmd("FlutterOutlineToggle"), "Toggle Widget Outline" },
	r = { utils.cmd("FlutterRun"), "Run Flutter" },
	R = { utils.cmd("FlutterRestart"), "Restart Flutter" },
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
utils.map_on_filetype("lua", {
	["s"] = { utils.cmd("source %"), "Source" },
	r = { utils.cmd("LuaRun"), "Run Currenet Buffer" },
})

-- Python Special Keymaps
utils.map_on_filetype("python", {
	["r"] = { utils.cmd("RunCode"), "Run" },
})
