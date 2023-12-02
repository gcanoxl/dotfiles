return {
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
		},
	},
}
