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
wk.add({
	{ "<leader>", group = "main" }, -- Top-level group for leader key mappings
	{ "<leader><leader>", "<cmd>Telescope commands<CR>", desc = "Commands", mode = "n" },

	-- Application group
	{ "<leader>a", group = "Application" },
	{ "<leader>aq", "<cmd>quitall<CR>", desc = "Quit", mode = "n" },
	{ "<leader>an", "<cmd>noh<CR>", desc = "Stop Highlight", mode = "n" },
	{ "<leader>aj", "<cmd>Telescope jumplist<CR>", desc = "Jumplist", mode = "n" },
	{ "<leader>as", "<cmd>Telescope live_grep<CR>", desc = "Search", mode = "n" },
	{ "<leader>ah", "<cmd>Telescope help_tags<CR>", desc = "Help", mode = "n" },
	{ "<leader>ac", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme", mode = "n" },
	{ "<leader>ak", "<cmd>Telescope keymaps<CR>", desc = "Keymaps", mode = "n" },
	{ "<leader>at", "<cmd>TodoTelescope<CR>", desc = "Todo List", mode = "n" },
	{ "<leader>ae", "<cmd>Telescope emoji<CR>", desc = "Emoji", mode = "n" },
	{ "<leader>am", "<cmd>Telescope notify<CR>", desc = "Messages", mode = "n" },

	-- Neoconf group
	{ "<leader>C", group = "Neoconf" },
	{ "<leader>Cc", "<cmd>Neoconf<CR>", desc = "Select Config", mode = "n" },
	{ "<leader>Cl", "<cmd>Neoconf local<CR>", desc = "Edit Local Config", mode = "n" },
	{ "<leader>Cg", "<cmd>Neoconf global<CR>", desc = "Edit Global Config", mode = "n" },
	{ "<leader>Cs", "<cmd>Neoconf show<CR>", desc = "Show Config", mode = "n" },
	{ "<leader>Cp", "<cmd>Neoconf lsp<CR>", desc = "Show LSP Config", mode = "n" },

	-- Buffers group
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bb", "<cmd>Telescope scope buffers<CR>", desc = "Buffers", mode = "n" },
	{ "<leader>bB", "<cmd>Telescope buffers<CR>", desc = "Tab-local Buffers", mode = "n" },
	{ "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Close Other Buffers", mode = "n" },
	{ "<leader>bh", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer", mode = "n" },
	{ "<leader>bm", "<cmd>ScopeMoveBuf<CR>", desc = "Move to Table", mode = "n" },
	{ "<leader>bl", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer", mode = "n" },
	{ "<leader>bH", "<cmd>BufferLineMovePrev<CR>", desc = "Move Left", mode = "n" },
	{ "<leader>bL", "<cmd>BufferLineMoveNext<CR>", desc = "Move Right", mode = "n" },
	{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin", mode = "n" },
	{ "<leader>bP", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer", mode = "n" },
	{ "<leader>bn", "<cmd>enew<CR>", desc = "New Buffer", mode = "n" },
	{
		"<leader>bc",
		function()
			utils.bufdelete.delete()
		end,
		desc = "Close Buffer",
		mode = "n",
	},

	-- File group
	{ "<leader>f", group = "File" },
	{ "<leader>fw", "<cmd>silent wa<CR>", desc = "Save File", mode = "n" },
	{ "<leader>fl", "<cmd>Neotree<CR>", desc = "File Explorer", mode = "n" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files", mode = "n" },
	{ "<leader>fd", "<cmd>Dired<CR>", desc = "File Manager", mode = "n" },

	-- Git group
	{ "<leader>g", group = "Git" },
	{
		"<leader>gg",
		function()
			require("neogit").open()
		end,
		desc = "Git",
		mode = "n",
	},
	{ "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk", mode = "n" },
	{ "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage Buffer", mode = "n" },
	{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk", mode = "n" },
	{ "<leader>gx", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk", mode = "n" },
	{ "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk", mode = "n" },
	{ "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", desc = "Previous Hunk", mode = "n" },
	{ "<leader>gB", "<cmd>Gitsigns blame<CR>", desc = "Blame File", mode = "n" },
	{ "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame Line", mode = "n" },

	-- Debug group
	{ "<leader>d", group = "Debug" },
	{
		"<leader>ds",
		function()
			require("osv").launch({ port = 8086 })
		end,
		desc = "Start Debug Server",
	},
	{
		"<leader>db",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "Toggle Breakpoint",
	},
	{
		"<leader>du",
		function()
			require("dapui").toggle()
		end,
		desc = "Toggle DAP UI",
	},
	{
		"<leader>dc",
		function()
			require("dap").continue()
		end,
		desc = "Start or Continue",
	},
	{
		"<leader>dn",
		function()
			require("dap").step_over()
		end,
		desc = "Step Over",
	},
	{
		"<leader>di",
		function()
			require("dap").step_into()
		end,
		desc = "Step Into",
	},
	{
		"<leader>do",
		function()
			require("dap").step_out()
		end,
		desc = "Step Out",
	},
	{
		"<leader>dq",
		function()
			require("dap").terminate()
		end,
		desc = "Terminate",
	},
	{
		"<leader>dl",
		function()
			require("dap.repl").toggle()
		end,
		desc = "Toggle REPL",
	},
	{
		"<leader>dL",
		function()
			require("dap.repl").clear()
		end,
		desc = "Clear REPL",
	},
}, { mode = "n", noremap = true, silent = true })

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
