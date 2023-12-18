return {
	-- Window auto resizing
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.winheight = 10
			vim.o.winminheight = 10
			vim.o.equalalways = false
			require("windows").setup()
		end,
	},
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
			},

			---@type (Edgy.View.Opts|string)[]
			top = {},

			-- Options
			---@diagnostic disable-next-line: undefined-doc-name
			---@type table<Edgy.Pos, {size:integer | fun():integer, wo?:vim.wo}>
			options = {
				left = { size = 24 },
				bottom = { size = 10 },
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
				["<D-l>"] = function(win)
					print("1")
					win:resize("width", 2)
				end,
				-- decrease width
				-- ["<c-w><lt>"] = function(win)
				-- 	win:resize("width", -2)
				-- end,
			},
		},
	},
}
