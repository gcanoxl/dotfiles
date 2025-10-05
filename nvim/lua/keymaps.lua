-- Remap jk to <ESC>
vim.keymap.set("i", "jk", "<esc>")

-- Use C-i C-o to jump between locations
vim.keymap.set("n", "<C-i>", "<C-]>")

-- Fold
vim.keymap.set("n", "<tab>", "za")

-- Buffers
vim.keymap.set("n", "<C-c>", utils.bufdelete.delete)
vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "{", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "}", "<cmd>BufferLineCycleNext<cr>")

-- Tabs
vim.keymap.set("n", "<C-[>", "<cmd>tabprevious<cr>")
vim.keymap.set("n", "<C-]>", "<cmd>tabnext<cr>")

-- File
vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>")

-- Emoji
vim.keymap.set("i", "<C-e>", "<cmd>Telescope emoji<cr>")

-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

local wk = require("which-key")

-- ========================================
-- |        Keymaps with <Leader>         |
-- ========================================
wk.add({
	mode = { "n", "x" },
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
	{ "<leader><leader>", "<cmd>Telescope commands<cr>", group = "Commands", desc = "Telescope commands" },
	-- Application
	{ "<leader>a", group = "Application" },
	{ "<leader>aq", "<cmd>quitall<cr>", desc = "Quit" },
	{ "<leader>an", "<cmd>noh<cr>", desc = "Stop Highlight" },
	{ "<leader>aj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
	{ "<leader>as", "<cmd>Telescope live_grep<cr>", desc = "Search" },
	{ "<leader>ah", "<cmd>Telescope help_tags<cr>", desc = "Help" },
	{ "<leader>ac", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
	{ "<leader>ak", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>at", "<cmd>TodoTelescope<cr>", desc = "Todo List" },
	{ "<leader>ae", "<cmd>Telescope emoji<cr>", desc = "Emoji" },
	{ "<leader>am", "<cmd>Telescope notify<cr>", desc = "Messages" },
	-- Config
	{ "<leader>c", group = "Config" },
	{ "<leader>cc", utils.config_files, desc = "Edit Config" },

	-- Neoconf
	{ "<leader>C", group = "Neoconf" },
	{ "<leader>Cc", "<cmd>Neoconf<cr>", desc = "Select Config" },
	{ "<leader>Cl", "<cmd>Neoconf local<cr>", desc = "Edit Local Config" },
	{ "<leader>Cg", "<cmd>Neoconf global<cr>", desc = "Edit Global Config" },
	{ "<leader>Cs", "<cmd>Neoconf show<cr>", desc = "Show Config" },
	{ "<leader>Cp", "<cmd>Neoconf lsp<cr>", desc = "Show LSP Config" },
	-- Terminal
	{ "<leader>!", utils.term.select, desc = "Open Terminal" },
	-- Tab
	{ "<leader>t", group = "Tab" },
	{ "<leader>tn", "<cmd>tabnew<cr>", desc = "New Empty Tab" },
	{ "<leader>tc", "<cmd>tabclose<cr>", desc = "Close Current Table" },
	{ "<leader>tt", require("telescope-tabs").list_tabs, desc = "Tabs" },
	{ "<leader>t1", "<cmd>exec 'normal! 1gt'<cr>", desc = "Go to Tab 1" },
	{ "<leader>t2", "<cmd>exec 'normal! 2gt'<cr>", desc = "Go to Tab 2" },
	{ "<leader>t3", "<cmd>exec 'normal! 3gt'<cr>", desc = "Go to Tab 3" },
	{ "<leader>t4", "<cmd>exec 'normal! 4gt'<cr>", desc = "Go to Tab 4" },
	{ "<leader>t5", "<cmd>exec 'normal! 5gt'<cr>", desc = "Go to Tab 5" },
	{ "<leader>t6", "<cmd>exec 'normal! 6gt'<cr>", desc = "Go to Tab 6" },
	{ "<leader>t7", "<cmd>exec 'normal! 7gt'<cr>", desc = "Go to Tab 7" },
	{ "<leader>t8", "<cmd>exec 'normal! 8gt'<cr>", desc = "Go to Tab 8" },
	{ "<leader>t9", "<cmd>exec 'normal! 9gt'<cr>", desc = "Go to Tab 9" },
	-- Buffer
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>bB", "<cmd>Telescope buffers<cr>", desc = "Tab-local Buffers" },
	{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffers" },
	{ "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
	{ "<leader>bl", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	{ "<leader>bH", "<cmd>BufferLineMovePrev<cr>", desc = "Move Left" },
	{ "<leader>bL", "<cmd>BufferLineMoveNext<cr>", desc = "Move Right" },
	{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin" },
	{ "<leader>bP", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
	{ "<leader>bn", "<cmd>enew<cr>", desc = "New Buffer" },
	{ "<leader>bc", utils.bufdelete.delete, desc = "Close Buffer" },
	-- Diagnostic
	{ "<leader>e", group = "Diagnostic" },
	-- File
	{ "<leader>f", group = "File" },
	{ "<leader>fw", "<cmd>silent wa<cr>", desc = "Save File" },
	{ "<leader>fl", "<cmd>Neotree<cr>", desc = "File Explorer" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
	{ "<leader>fd", "<cmd>Dired<cr>", desc = "File Manager" },
	-- Window
	{ "<leader>w", group = "Window" },
	{ "<leader>wa", desc = "Auto Resize" },
	{ "<leader>wat", "<cmd>WindowsToggleAutowidth<cr>", desc = "Toggle Auto Width" },
	{ "<leader>wae", "<cmd>WindowsEqualize<cr>", desc = "Equalize Width" },
	{ "<leader>wam", "<cmd>WindowsMaximize<cr>", desc = "Maximize Width" },
	-- Git
	{
		"<leader>g",
		-- function()
		-- 	require("which-key").show({ keys = "<leader>g", loop = true })
		-- end,
		group = "Git",
	},
	{ "<leader>gg", require("neogit").open, desc = "Git" },
	{
		"<leader>gG",
		function()
			utils.lazygit:open()
		end,
		desc = "Git",
	},
	{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
	{ "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer" },
	{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
	{ "<leader>gx", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
	{ "<leader>gd", group = "Diff" },
	{ "<leader>gdd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff This" },
	{ "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close Diff" },
	{ "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
	{ "<leader>gdt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle Files" },
	{ "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
	{ "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous Hunk" },
	{ "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview Hunk" },
	{ "<leader>gH", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk Popup" },

	{ "<leader>gl", "<cmd>Neotree git_status<cr>", desc = "Git Status" },
	{ "<leader>gt", group = "Toggle" },
	{ "<leader>gtl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Line Highlight" },
	{ "<leader>gtn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Number Highlight" },
	{ "<leader>gts", "<cmd>Gitsigns toggle_signs<cr>", desc = "Signs" },
	{ "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Blame" },
	{ "<leader>gB", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
	-- Project
	{ "<leader>p", group = "Project" },
	{
		"<leader>pp",
		function()
			require("telescope").extensions.projects.projects({})
		end,
		desc = "Projects",
	},
	{ "<leader>pP", "<cmd>ProjectRoot<cr>", desc = "Reset Root Directory" },
	{ "<leader>pa", "<cmd>AddProject<cr>", desc = "Add Project" },
	-- Package Management
	{ "<leader>P", "<cmd>Lazy<cr>", desc = "Package Management" },
	-- Debug
	{ "<leader>d", group = "Debug" },
	{
		"<leader>ds",
		function()
			require("osv").launch({ port = 8086 })
		end,
		desc = "Start Debug Server",
	},
	{ "<leader>db", require("dap").toggle_breakpoint, desc = "Toggle Breakpoint" },
	{ "<leader>du", require("dapui").toggle, desc = "Toggle DAP UI" },
	{ "<leader>dc", require("dap").continue, desc = "Start or Continue" },
	{ "<leader>dn", require("dap").step_over, desc = "Step Over" },
	{ "<leader>di", require("dap").step_into, desc = "Step Into" },
	{ "<leader>do", require("dap").step_out, desc = "Step Out" },
	{ "<leader>dq", require("dap").terminate, desc = "Terminate" },
	{ "<leader>dl", require("dap.repl").toggle, desc = "Toggle REPL" },
	{ "<leader>dL", require("dap.repl").clear, desc = "Clear REPL" },
	-- Competitive Programming
	{ "<leader>I", group = "Competitive" },
	{
		"<leader>Ic",
		function()
			local ok, picker = pcall(require, "fzf-lua")
			if not ok then
				vim.notify("fzf-lua not found", vim.log.levels.ERROR)
				return
			end
			picker.fzf_exec("fd --type d", {
				actions = {
					["default"] = function(selected)
						_G.received_position = vim.fn.fnamemodify(selected[1], ":p")
					end,
				},
			})
			vim.cmd("CompetiTest receive problem")
		end,
		desc = "Receive Problem",
	},
	{
		"<leader>Ir",
		"<cmd>CompetiTest run<cr>",
		desc = "Run",
	},
	{
		"<leader>Ia",
		"<cmd>CompetiTest add_testcase<cr>",
		desc = "Add Testcase",
	},
	{
		"<leader>Ie",
		"<cmd>CompetiTest edit_testcase<cr>",
		desc = "Edit Testcase",
	},
	{
		"<leader>Id",
		"<cmd>CompetiTest delete_testcase<cr>",
		desc = "Delete Testcase",
	},
})

-- Go Special Keymaps
utils.map_on_filetype("go", {
	a = { "<cmd>GoAlt<cr>", "Alt" },
	t = {
		name = "Test",
		t = { "<cmd>GoTest<cr>", "GoTest" },
	},
	c = { "<cmd>GoCodeAction<cr>", "GoCodeAction", mode = { "n", "v" } },
})

-- Dart Special Keymaps
utils.map_on_filetype("dart", {
	["<localleader>"] = { "<cmd>Telescope flutter commands<cr>", "Flutter Commands" },
	e = { "<cmd>FlutterEmulators<cr>", "Emulators" },
	w = { "<cmd>FlutterOutlineToggle<cr>", "Toggle Widget Outline" },
	r = { "<cmd>FlutterRun<cr>", "Run Flutter" },
	R = { "<cmd>FlutterRestart<cr>", "Restart Flutter" },
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

local augroup = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup,
	callback = function(data)
		local client = vim.lsp.get_client_by_id(data.data.client_id)
		if not client then
			vim.notify("Failed to get LSP Client by Id: " .. data.id, vim.log.levels.WARN)
			return
		end

		local buf = data.buf
		if client:supports_method("textDocument/inlayHint", buf) then
			vim.lsp.inlay_hint.enable(false, { bufnr = buf })
		end
		-- shortcuts
		local bufopts = { noremap = true, silent = true, buffer = buf }
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"go",
			":Telescope lsp_dynamic_workspace_symbols<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"gl",
			":Telescope lsp_document_symbols<CR>",
			{ noremap = true, silent = true }
		)

		-- register keymaps using which-key
		require("which-key").add({
			{ "<leader>l", group = "LSP" }, -- group for LSP
			{ "<leader>ln", vim.lsp.buf.rename, desc = "Rename", buffer = buf },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
			{ "<leader>l", group = "Goto" },
			{ "<leader>lgD", vim.lsp.buf.type_definition, desc = "Type Definition" },
			{ "<leader>lgi", vim.lsp.buf.implementation, desc = "Implementation" },
			{ "<leader>lgo", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
			{ "<leader>lgl", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
			{ "<leader>lt", group = "Toggle", buffer = buf },
			{ "<leader>lti", utils.toggles.toggle_inlay_hint, desc = "Inlay Hint" },
		})
	end,
})

-- Lua Special Keymaps
utils.map_on_filetype("lua", {
	["s"] = { "<cmd>source %<cr>", "Source" },
	r = { "<cmd>LuaRun<cr>", "Run Currenet Buffer" },
})

-- Python Special Keymaps
utils.map_on_filetype("python", {
	["r"] = { "<cmd>RunCode<cr>", "Run" },
})
