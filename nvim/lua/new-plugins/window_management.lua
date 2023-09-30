return {
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
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
			fix_win_height = false,
		}
	}
}
