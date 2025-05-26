---@diagnostic disable: undefined-doc-name
return {
	-- Edgy
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
			-- Layout
			---@type (Edgy.View.Opts|string)[]
			left = {
				{
					title = "File Explorer",
					ft = "neo-tree",
					size = {
						width = 24,
					},
				},
				{
					title = "DAP Scopes",
					ft = "dapui_scopes",
					size = {
						width = 24,
						height = 0.3,
					},
				},
				{
					title = "DAP Watches",
					ft = "dapui_watches",
					size = {
						width = 24,
						height = 0.3,
					},
				},
				{
					title = "DAP Stacks",
					ft = "dapui_stacks",
					size = {
						width = 24,
						height = 0.2,
					},
				},
				{
					title = "DAP Breakpoints",
					ft = "dapui_breakpoints",
					size = {
						width = 24,
						height = 0.2,
					},
				},
			},

			---@type (Edgy.View.Opts|string)[]
			right = {
				{
					title = "Symbol Outline",
					ft = "aerial",
				},
				{
					title = "Widget Outline",
					ft = "flutterToolsOutline",
				},
			},

			---@type (Edgy.View.Opts|string)[]
			bottom = {
				{
					title = "REPL",
					ft = "dap-repl",
				},
				{
					title = "DAP Consoles",
					ft = "dapui_console",
				},
				{
					title = "Terminal",
					ft = "toggleterm",
				},
				{
					title = "QuickFix",
					ft = "qf",
				},
			},

			---@type (Edgy.View.Opts|string)[]
			top = {
				{ title = "Help", ft = "help" },
			},

			-- Options
			-- -@type table<Edgy.Pos, {size:integer | fun():integer, wo?:vim.wo}>
			options = {
				left = { size = 24 },
				bottom = { size = 0.36 },
				right = { size = 30 },
				top = { size = 10 },
			},
			---@type vim.wo
			wo = {
				winbar = true,
				winfixwidth = true,
				winfixheight = true,
				winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
				spell = false,
				signcolumn = "no",
			},
			animate = {
				enabled = false,
			},
			keys = {
				-- ["<D-l>"] = function(win)
				-- 	print("1")
				-- 	win:resize("width", 2)
				-- end,
				-- decrease width
				-- ["<c-w><lt>"] = function(win)
				-- 	win:resize("width", -2)
				-- end,
			},
		},
	},
}
