-- TODO: implement
-- local filetypes_dir = vim.fn.stdpath('config') .. '/lua/plugins/nvim-dap/filetypes'
--
-- local globpath = vim.fn.globpath
-- local split = vim.fn.split
--
-- local filetypes = split(globpath(filetypes_dir, '*.lua'), '\n')

require('plugins.nvim-dap.filetypes.dart')

local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
	return
end
dapui.setup({
	layouts = {
		{
			-- You can change the order of elements in the sidebar
			elements = {
				-- Provide IDs as strings or tables with "id" and "size" keys
				{ id = "scopes",      size = 2, },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks",      size = 0.25 },
				{ id = "watches",     size = 0.25 },
			},
			size = 24,
			position = "left", -- Can be "left" or "right"
		},
		{
			elements = {
				{ id = "console", size = 0.4 },
				{ id = "repl",    size = 0.6 },
			},
			size = 8,
			position = "bottom", -- Can be "bottom" or "top"
		},
	},
})
