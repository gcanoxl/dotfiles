return {
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
			-- Layout
			---@type (Edgy.View.Opts|string)[]
			left = {
				-- Neo-tree filesystem always takes half the screen height
				{
					title = "File Explorer",
					ft = "neo-tree",
					-- pin = true,
					-- filter = function(buf)
					-- 	return vim.b[buf].neo_tree_source == "filesystem"
					-- end,
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
					-- pin = true,
				},
				{
					title = "Widget Outline",
					ft = "flutterToolsOutline",
					-- pin = true,

				},
			},

			---@type (Edgy.View.Opts|string)[]
			bottom = {
				{
					title = "REPL",
					ft = "dap-repl",
					-- pin = true,

				},
			},

			---@type (Edgy.View.Opts|string)[]
			top = {},

			-- Options
			---@type table<Edgy.Pos, {size:integer | fun():integer, wo?:vim.wo}>
			options = {
				left = { size = 24 },
				bottom = { size = 10 },
				right = { size = 30 },
				top = { size = 10 },
			},
			---@type vim.wo
			wo = {
				-- Setting to `true`, will add an edgy winbar.
				-- Setting to `false`, won't set any winbar.
				-- Setting to a string, will set the winbar to that string.
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
		}
	}

}
